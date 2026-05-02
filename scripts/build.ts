#!/usr/bin/env node

import * as fs from "node:fs";
import * as fsp from "node:fs/promises";
import path from "node:path";
import * as z from "zod";

await prepareSchemas().then(() => console.log("prepared schemas"));

if (process.env.ONLY_PREPARE_SCHEMA) {
	console.log("exiting early");
	process.exit(0);
}

const excludedFileTypes = ["json", "lua", "mjs"].map(
	(extension) => `.${extension}`,
);

const schemaFilenames = await fsp.readdir(import.meta.dirname);
const schemaRelativeFilenames = schemaFilenames
	.filter((name) => !excludedFileTypes.some((ft) => name.endsWith(ft)))
	.map((filename) => import.meta.dirname + "/" + filename);

const schemas = [];

for (const file of schemaRelativeFilenames) {
	const filename = path.resolve(file);
	const module = (await import(filename)) as Record<string, z.ZodObject>;
	schemas.push({ filename, module });
}

for (const schema of schemas) {
	const dirname = path.dirname(schema.filename);
	const exports = Object.entries<z.ZodObject>(schema.module);
	for (const [name, zodSchema] of exports) {
		if (!name.endsWith("Schema")) continue;
		const jsonSchema = z.toJSONSchema(zodSchema);
		const jsonFile = JSON.stringify(jsonSchema);
		const filename = formatKebabCase(name.replace("Schema", ""));
		const filepath = path.resolve(dirname, filename);
		await fsp.writeFile(filepath, jsonFile);
	}
}

async function createAllModesFile() {
	await fsp.writeFile(
		path.resolve(import.meta.dirname, "modes.ts"),
		`
export const MODES = ["c", "i", "l", "n", "o", "s", "t", "v", "x"] as const;

export const ALL_MODES = ${JSON.stringify(generateModeOptions())} as const;
		`.trim(),
	);
}

async function createPossiblePluginsFile() {
	const excluded = new Set(
		["ascii", "enabled", "packs", "shortcuts"].map((file) => `${file}.lua`),
	);

	const possible = fs
		.globSync("**/plugins/**/*.lua")
		.map((file) => file.replace("lua/plugins/", ""))
		.filter((f) => !excluded.has(path.basename(f)))
		.map((file) => {
			return file.replace(".lua", "").replaceAll("/", ".");
			// .replace(".init", "");
		})
		// remove root plugins.init file
		.filter((file) => file !== "init")
		.flatMap((file) =>
			file.includes("init") ? [file.replace(".init", ""), file] : [file],
		)
		.map((file) => [file, []]);

	await fsp.writeFile(
		path.resolve(import.meta.dirname, "possible-plugins.json"),
		JSON.stringify(Object.fromEntries(possible)),
	);
}

function formatKebabCase(property: string) {
	return (
		property.replaceAll(/(?<!^)(?=[A-Z])/g, "-") + ".json"
	).toLowerCase();
}

// ai generated function to comma separate every possibility
function generateModeOptions(
	modes = ["c", "i", "l", "n", "o", "s", "t", "v", "x"],
) {
	const results = new Set();

	const total = 1 << modes.length;

	for (let mask = 1; mask < total; mask++) {
		const combo = [];
		for (const [index, mode] of modes.entries()) {
			if (mask & (1 << index)) {
				combo.push(mode);
			}
		}
		combo.sort();
		results.add(combo.join(","));
	}

	return [...results].toSorted();
}

async function prepareSchemas() {
	await Promise.all([
		createAllModesFile(),
		createPossiblePluginsFile(),
		//
	]);
}

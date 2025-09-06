#!/usr/bin/env node

import * as fs from "node:fs";
import * as fsp from "node:fs/promises";
import * as path from "node:path";
import * as z from "zod";

await prepareSchemas().then(() => console.log("prepared schemas"));

if (process.env.ONLY_PREPARE_SCHEMA) {
	console.log("exiting early");
	process.exit(0);
}

const excludedFileTypes = ["json", "lua", "mjs"].map((ext) => `.${ext}`);

const schemaFilenames = await fsp.readdir(import.meta.dirname);

const schemas = await Promise.all(
	schemaFilenames
		.filter((name) => !excludedFileTypes.some((ft) => name.endsWith(ft)))
		.map((filename) => import.meta.dirname + "/" + filename)
		.map(async (file) => {
			const filename = path.resolve(file);
			/** @type Record<string, z.ZodObject> */
			const module = await import(filename);
			return { filename, module };
		}),
);

await Promise.all(
	schemas.map((schema) => {
		const dirname = path.dirname(schema.filename);
		return Object.entries(schema.module).map(async ([name, zodSchema]) => {
			if (!name.endsWith("Schema")) return;
			const jsonSchema = z.toJSONSchema(zodSchema);
			const jsonFile = JSON.stringify(jsonSchema);
			const filename = formatKebabCase(name.replace("Schema", ""));
			const filepath = path.resolve(dirname, filename);
			await fsp.writeFile(filepath, jsonFile);
		});
	}),
);

function formatKebabCase(property) {
	return (property.replace(/(?<!^)(?=[A-Z])/g, "-") + ".json").toLowerCase();
}

async function prepareSchemas() {
	await Promise.all([
		createAllModesFile(),
		createPossiblePluginsFile(),
		//
	]);
}

async function createPossiblePluginsFile() {
	const excluded = ["ascii", "enabled", "packs", "shortcuts"].map(
		(file) => `${file}.lua`,
	);

	const possible = fs
		.globSync("**/plugins/**/*.lua")
		.map((file) => file.replace("lua/plugins/", ""))
		.filter((f) => !excluded.some((m) => path.basename(f) === m))
		.map((file) => {
			return file
				.replace(".lua", "")
				.replace(/\//g, ".")
				.replace(".init", "");
		})
		// remove root plugins.init file
		.filter((file) => file !== "init")
		.map((file) => [file, []]);

	await fsp.writeFile(
		path.resolve(import.meta.dirname, "possible-plugins.json"),
		JSON.stringify(Object.fromEntries(possible)),
	);
}

async function createAllModesFile() {
	await fsp.writeFile(
		path.resolve(import.meta.dirname, "modes.json"),
		JSON.stringify(generateModeOptions()),
	);
}

// ai generated function to comma separate every possibility
function generateModeOptions(
	modes = ["c", "i", "l", "n", "o", "s", "t", "v", "x"],
) {
	const results = new Set();

	const total = 1 << modes.length;

	for (let mask = 1; mask < total; mask++) {
		const combo = [];
		for (let i = 0; i < modes.length; i++) {
			if (mask & (1 << i)) {
				combo.push(modes[i]);
			}
		}
		combo.sort();
		results.add(combo.join(","));
	}

	return Array.from(results).sort();
}

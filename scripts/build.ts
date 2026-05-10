#!/usr/bin/env node

import * as fsp from "node:fs/promises";
import path from "node:path";
import * as z from "zod";

await prepareSchemas().then(() => console.info("prepared schemas"));

if (process.env.ONLY_PREPARE_SCHEMA) {
	console.info("exiting early");
	process.exit(0);
}

const excludedFileTypes = ["json", "lua", "mjs"].map((extension) => {
	return `.${extension}`;
});

const schemaDirectory = path.join(import.meta.dirname, "./schemas/");
const schemaFilenames = await fsp.readdir(schemaDirectory);

type ZodSchemaModule = Record<
	string,
	z.ZodObject<z.core.$ZodLooseShape, z.core.$strip>
>;

const schemas = new Array<{
	filename: string;
	module: ZodSchemaModule;
}>();

for (const filename of schemaFilenames) {
	if (excludedFileTypes.some((ft) => filename.endsWith(ft))) continue;
	const schemaFilename = path.join(schemaDirectory, filename);
	const current = path.resolve(schemaFilename);
	const module = (await import(schemaFilename)) as ZodSchemaModule;
	schemas.push({ filename: current, module });
}

for (const schema of schemas) {
	const dirname = path.dirname(schema.filename);
	const entries = Object.entries(schema.module);
	for (const [name, zodSchema] of entries) {
		if (!name.endsWith("Schema")) continue;
		const jsonSchema = z.toJSONSchema(zodSchema);
		const jsonFile = JSON.stringify(jsonSchema);
		const filename = formatKebabCase(name.replace("Schema", ""));
		const filepath = path.resolve(dirname, filename);
		await fsp.writeFile(filepath, jsonFile);
	}
}

async function createAllModesFile() {
	const ts = String.raw;
	await fsp.writeFile(
		path.join(import.meta.dirname, "./schemas/", "modes.ts"),
		ts`
export const MODES = ["c", "i", "l", "n", "o", "s", "t", "v", "x"] as const;

export const ALL_MODES = ${JSON.stringify(generateModeOptions())} as const;
		`.trim(),
	);
}

function formatKebabCase(property: string) {
	return `${property.replaceAll(/(?<!^)(?=[A-Z])/g, "-")}.json`.toLowerCase();
}

// ai generated function to comma separate every possibility
function generateModeOptions(
	modes = ["c", "i", "l", "n", "o", "s", "t", "v", "x"],
) {
	const results = new Set<string>();

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

	const sorted = [...results].toSorted();
	return sorted as string[];
}

async function prepareSchemas() {
	await createAllModesFile();
}

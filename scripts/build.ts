#!/usr/bin/env node

import * as fsp from "node:fs/promises";
import path from "node:path";
import * as z from "zod";

type ZodObject = z.ZodObject<z.core.$ZodLooseShape, z.core.$strip>;
type ZodSchemaModule = Record<string, ZodObject>;

const schemas = new Array<{ filename: string; module: ZodSchemaModule }>();
const schemaDirectory = path.join(import.meta.dirname, "./schemas/");
const schemaFilenames = await fsp.readdir(schemaDirectory);
const excludedFileTypes = ["json", "lua", "mjs"].map((extension) => {
	return `.${extension}`;
});

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

function formatKebabCase(property: string) {
	return `${property.replaceAll(/(?<!^)(?=[A-Z])/g, "-")}.json`.toLowerCase();
}

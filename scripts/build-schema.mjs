#!/usr/bin/env node

import * as fs from "node:fs";
import * as fsp from "node:fs/promises";
import * as path from "node:path";
import * as z from "zod";

const schemas = await Promise.all(
	fs.globSync("**/*schema.ts").map(async (file) => {
		const filename = path.resolve(file);
		/** @type Record<string, z.ZodObject> */
		const module = await import(filename);
		return { filename, module };
	}),
);

await Promise.all(
	schemas.map((schema) => {
		const dirname = path.dirname(schema.filename);
		return Object.entries(schema.module).map(
			async ([name, zodSchema], i, all) => {
				console.log("evaluating ", name);
				const hasMore = all.length > 1;
				const jsonSchema = z.toJSONSchema(zodSchema);
				const jsonFile = JSON.stringify(jsonSchema);
				const filename = hasMore ? format(name) : "schema.json";
				const filepath = path.resolve(dirname, filename);
				await fsp.writeFile(filepath, jsonFile);
				console.log("done evaluating");
			},
		);
	}),
);

function format(property) {
	return (property.replace(/(?<!^)(?=[A-Z])/g, "-") + ".json").toLowerCase();
}

#!/usr/bin/env node

import * as fs from "node:fs";
import * as fsp from "node:fs/promises";
import * as os from "node:os";
import * as path from "node:path";

const homedir = os.homedir();

const output = path.join(homedir, "bloat.json");

if (fs.existsSync(output)) {
	console.info("output file already exists");
	process.exit(0);
}

const bloatFn = path.join(homedir, "nvim-bloat-analysis.json");

const bloat = await fsp.readFile(bloatFn, { encoding: "utf8" });

const bloatJson = JSON.parse(bloat);

await fsp.writeFile(output, JSON.stringify(removePrefix(bloatJson)));

function removePrefix(obj) {
	for (const [key, value] of Object.entries(obj)) {
		if (typeof value !== "object") continue;
		delete obj[key];
		const newKey = key.replace(/^.*\.local\/share\/nvim\/lazy\//g, "");
		obj[newKey] = removePrefix(value);
	}
	return obj;
}

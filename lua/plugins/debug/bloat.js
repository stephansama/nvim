#!/usr/bin/env node

import { findRoot } from "@manypkg/find-root";
import * as fs from "node:fs";
import * as fsp from "node:fs/promises";
import * as path from "node:path";

const { rootDir } = await findRoot(process.cwd());

const output = path.resolve(path.join(rootDir, "dist", "bloat.json"));
const input = path.resolve(path.join(rootDir, "bloat.json"));

await fsp.mkdir(path.dirname(output), { recursive: true });

if (fs.existsSync(output)) {
	console.info("output file already exists");
	process.exit(0);
}

const bloat = await fsp.readFile(input, { encoding: "utf8" });

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

#!/usr/bin/env node

import * as fs from "node:fs";

const buildInformationFiles = fs.globSync("**/*.tsbuildinfo");

console.info("deleting build information files", buildInformationFiles);

await rm(...buildInformationFiles);

const declarations = fs.globSync("{lua,scripts}/**/*.d.ts", {
	exclude: ["**/vim.d.ts"],
});

console.info("deleting declartion files", declarations);

await rm(...declarations);

const unwantedLuaFiles = fs.globSync("./scripts/**/*.lua", {
	exclude: ["lua/**/*.lua"],
});

console.info("deleting unwanted lua files", unwantedLuaFiles);

await rm(...unwantedLuaFiles);

async function rm(...files: Array<string>) {
	for (const file of files) {
		await fs.promises.rm(file);
	}
}

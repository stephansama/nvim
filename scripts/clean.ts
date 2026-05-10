#!/usr/bin/env node

import * as fs from "node:fs";

const declarations = fs.globSync("**/*.d.ts", { exclude: ["**/vim.d.ts"] });

console.info("deleting declartion files");

for (const file of declarations) {
	await fs.promises.rm(file);
}

console.info(declarations);

console.info("deleting unwanted lua files");

const unwantedLuaFiles = fs.globSync("./scripts/**/*.lua", {
	exclude: ["lua/**/*.lua"],
});

for (const file of unwantedLuaFiles) {
	await fs.promises.rm(file);
}

console.info(unwantedLuaFiles);

#!/usr/bin/env node

import * as fs from "node:fs";

await rm("build information files", ...fs.globSync("**/*.tsbuildinfo"));

await rm(
	"declartion files",
	...fs.globSync("{lua,scripts}/**/*.d.ts", { exclude: ["**/vim.d.ts"] }),
);

await rm(
	"unwanted lua files",
	...fs.globSync("./scripts/**/*.lua", { exclude: ["lua/**/*.lua"] }),
);

async function rm(fileType: string, ...files: Array<string>) {
	console.info(`--- deleting ${fileType}:`, files);

	for (const file of files) {
		await fs.promises.rm(file);
	}
}

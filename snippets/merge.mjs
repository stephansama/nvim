#!/usr/bin/env node

import cp from "node:child_process";
import fs from "node:fs";
import path from "node:path";
import { stdin as input, stdout as output } from "node:process";
import rl from "node:readline/promises";

const sh = String.raw;
const rlInterface = rl.createInterface({ input, output });

try {
	cp.execSync(sh` which degit `);
} catch (e) {
	/** please install [degit](https://github.com/Rich-Harris/degit) */
	console.error("degit is not installed");
	console.error("please install degit");
	process.exit(1);
}

const config = {
	lang: ["text"],
	inputDir: "./input/",
	outputFn: "output.json",
};

await queryConfig("github snippet path", async (input) => {
	const degitPath = input
		.replace("https://github.com/", "")
		.replace("tree/main/", "")
		.replace("tree/master/", "");

	if (fs.existsSync(config.inputDir)) {
		fs.rmSync(config.inputDir, {
			force: true,
			recursive: true,
		});
	}

	cp.execSync(sh`degit ${degitPath} ${config.inputDir}`);
});

await queryConfig("output filename", async (input) => {
	if (!input.endsWith(".json")) input += ".json";
	config.outputFn = input;
});

await queryConfig("language (comma separate)", async (input) => {
	const specialLanguages = createSpecialLanguages();
	config.lang = input.split(",").flatMap((a) => specialLanguages[a] || [a]);
});

const files = fs
	.readdirSync(config.inputDir, { withFileTypes: true })
	.filter((item) => item.isFile())
	.map((file) => config.inputDir + file.name);

const compiledData = files
	.map((file) => JSON.parse(fs.readFileSync(file, { encoding: "utf8" })))
	.reduce((prev, curr) => ({ ...prev, ...curr }), {});

fs.mkdirSync(path.dirname(config.outputFn), {
	recursive: true,
});

fs.writeFileSync(config.outputFn, JSON.stringify(compiledData, undefined, 2), {
	flag: "wx",
});

console.info("successfully created compiled snippet pack");

fs.rmSync(config.inputDir, {
	force: true,
	recursive: true,
});

const pkgFile = fs.readFileSync("./package.json", { encoding: "utf8" });
const pkgJson = JSON.parse(pkgFile);
const next = {
	language: config.lang,
	path: config.outputFn,
};

pkgJson.contributes.snippets = [...pkgJson.contributes.snippets, next];

fs.writeFileSync("./package.json", JSON.stringify(pkgJson, undefined, 2));

process.exit(0);

/**
 * @param {string} valueTxt
 * @param {(s: string)=>Promise<void>} cb
 */
async function queryConfig(valueTxt, cb) {
	const answer = await rlInterface.question(`what is the ${valueTxt}? ->`);
	if (answer) {
		await cb(answer);
	} else {
		console.info(`no ${valueTxt} supplied falling back to default`);
	}
}

function createSpecialLanguages() {
	return {
		js: ["javascript", "typescript", "javascriptreact", "typescriptreact"],
		ts: ["typescript", "typescriptreact"],
		["js-only"]: ["javascript", "javascriptreact"],
		["ts-only"]: ["typescript", "typescriptreact"],
		["js-react"]: ["javascriptreact"],
		["ts-react"]: ["typescriptreact"],
	};
}

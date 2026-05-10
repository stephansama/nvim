#!/usr/bin/env node

import * as cp from "node:child_process";
import * as fs from "node:fs";
import path from "node:path";
import { stdin as input, stdout as output } from "node:process";
import * as rl from "node:readline/promises";

import type snippet from "../snippets/base/lua.json";
import type pkg from "../snippets/package.json";

const rlInterface = rl.createInterface({ input, output });
const sh = String.raw;

type Snippet = (typeof snippet)[keyof typeof snippet];

try {
	cp.execSync(sh` which degit `);
} catch (error) {
	console.error(error);
	/** please install [degit](https://github.com/Rich-Harris/degit) */
	console.error("degit is not installed");
	console.error("please install degit");
	process.exit(1);
}

const config = {
	inputDir: "./input/",
	lang: ["text"],
	outputFn: "output.json",
};

await queryConfig("github snippet path", (input) => {
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

await queryConfig("output filename", (input) => {
	if (!input.endsWith(".json")) input += ".json";
	config.outputFn = input;
});

await queryConfig("language (comma separate)", (input) => {
	const specialLanguages = createSpecialLanguages();
	config.lang = input.split(",").flatMap<string>((a) => {
		return specialLanguages[a as keyof typeof specialLanguages] || [a];
	});
});

const files = fs
	.readdirSync(config.inputDir, { withFileTypes: true })
	.filter((item) => item.isFile())
	.map((file) => config.inputDir + file.name);

const compiledData = Object.assign(
	{},
	...files.map((file) => {
		return JSON.parse(
			fs.readFileSync(file, { encoding: "utf8" }),
		) as Snippet;
	}),
) as Snippet;

await fs.promises.mkdir(path.dirname(config.outputFn), {
	recursive: true,
});

await fs.promises.writeFile(
	config.outputFn,
	JSON.stringify(compiledData, undefined, 2),
	{ flag: "wx" },
);

console.info("successfully created compiled snippet pack");

await fs.promises.rm(config.inputDir, { force: true, recursive: true });

const pkgFile = fs.readFileSync("./package.json", "utf8");
const pkgJson = JSON.parse(pkgFile) as typeof pkg;
const next = { language: config.lang, path: config.outputFn };

pkgJson.contributes.snippets = [...pkgJson.contributes.snippets, next];

await fs.promises.writeFile(
	"./package.json",
	JSON.stringify(pkgJson, undefined, 2),
);

function createSpecialLanguages() {
	return {
		js: ["javascript", "typescript", "javascriptreact", "typescriptreact"],
		["js-only"]: ["javascript", "javascriptreact"],
		["js-react"]: ["javascriptreact"],
		ts: ["typescript", "typescriptreact"],
		["ts-only"]: ["typescript", "typescriptreact"],
		["ts-react"]: ["typescriptreact"],
	} as const;
}

async function queryConfig(
	valueTxt: string,
	callback: (input: string) => void,
): Promise<void>;
async function queryConfig(
	valueTxt: string,
	callback: (input: string) => Promise<void>,
): Promise<void>;
async function queryConfig(
	valueTxt: string,
	callback: (input: string) => Promise<void> | void,
) {
	const answer = await rlInterface.question(`what is the ${valueTxt}? ->`);
	if (answer) {
		await callback(answer);
	} else {
		console.info(`no ${valueTxt} supplied falling back to default`);
	}
}

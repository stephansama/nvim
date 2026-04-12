import * as packs from "./packs.json";

export const enabled = [
	"ai",
	"base",
	"cpp",
	"polyglot",
	"data",
	"docker",
	"go",
	"javascript",
	"lua",
	"markdown",
	"python",
	"rust",
	"shell",
	"zig",
] satisfies (keyof typeof packs)[];

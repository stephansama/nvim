import * as packs from "./packs.json";

export const enabled = [
	"base",
	"cpp",
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

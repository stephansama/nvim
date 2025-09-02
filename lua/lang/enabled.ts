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
	"rust",
	"shell",
	"zig",
	// "php",
	// "haskell",
	// "java",
	// "godot",
	// "python",
	// "csharp",
	// "snyk",
] as const satisfies (keyof typeof packs)[];

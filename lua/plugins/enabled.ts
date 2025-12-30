import * as possible from "@/schemas/possible-plugins.json";

export const enabled = [
	"debug.bloat",
	"editor",
	"lang.treesitter",
	"test",
	"ui",
] satisfies (keyof typeof possible)[];

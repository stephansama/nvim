export const enabled = [
	"editor",
	"lang.init",
	"lang.treesitter",
	"test",
	"ui",
] as const satisfies ("debug" | "editor" | "test" | "ui" | `lang.${string}`)[];

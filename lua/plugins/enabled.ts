export const enabled = [
	"editor",
	"lang.treesitter",
	"test",
	"ui",
] as const satisfies ("debug" | "editor" | "test" | "ui" | `lang.${string}`)[];

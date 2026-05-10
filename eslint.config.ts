import { config, presets } from "@stephansama/eslint-config";

export default await config({
	...presets.base,
	ignore: [
		"**/.editorconfig",
		"**/.gitignore",
		"**/.prettierignore",
		"**/*.lua",
		"**/pnpm-lock.yaml",
	],
	json: true,
	markdown: true,
	zod: true,
});

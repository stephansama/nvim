import { config, presets } from "@stephansama/eslint-config";

export default await config(
	{
		...presets.base,
		baseline: false,
		markdown: true,
		typescript: { defaultProject: "./tsconfig.eslint.json" },
	},
	{
		configs: [
			{
				rules: {
					"unicorn/prefer-spread": "off",
				},
			},
		],
	},
);

local schemas = {
	{
		description = "Oh My Posh config",
		fileMatch = "*.omp.json",
		url = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
	},
	{
		description = "Markdownlint configuration",
		fileMatch = { ".markdownlint.json", ".markdownlint.jsonc", ".markdownlint.yaml" },
		url = "https://raw.githubusercontent.com/DavidAnson/markdownlint/main/schema/markdownlint-config-schema.json",
	},
	{
		description = "Nodemon configuration",
		fileMatch = { "nodemon.json" },
		url = "https://json.schemastore.org/nodemon.json",
	},
	{
		description = "Vercel config",
		fileMatch = { "vercel.json" },
		url = "https://openapi.vercel.sh/vercel.json",
	},
	{
		description = "Typescript config",
		fileMatch = { "tsconfig.json", "tsconfig.node.json" },
		url = "http://json.schemastore.org/tsconfig",
	},
	{
		description = "ESLint config",
		fileMatch = { ".eslintrc.json", ".eslintrc" },
		url = "http://json.schemastore.org/eslintrc",
	},
	{
		description = "Prettier config",
		fileMatch = { ".prettierrc.json5", ".prettierrc.json", ".prettierrc" },
		url = "https://json.schemastore.org/prettierrc",
	},
	{
		description = "Package config",
		fileMatch = { "package.json" },
		url = "https://json.schemastore.org/package",
	},
	{
		description = "Packer config",
		fileMatch = { "packer.json" },
		url = "https://json.schemastore.org/packer",
	},
	{
		description = "Renovate config",
		url = "https://docs.renovatebot.com/renovate-schema",
		fileMatch = {
			"renovate.json",
			"renovate.json5",
			".github/renovate.json",
			".github/renovate.json5",
			".renovaterc",
			".renovaterc.json",
		},
	},
	{
		description = "OpenApi config",
		fileMatch = { "*api*.json" },
		url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json",
	},
	{
		description = "Tasks config",
		fileMatch = { "*tasks*.json" },
		url = "https://json.schemastore.org/task.json",
	},
}

return { json = { schemas = schemas } }

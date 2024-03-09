local json_schemas = {
	{
		description = "ESLint config",
		fileMatch = { ".eslintrc.json", ".eslintrc" },
		url = "http://json.schemastore.org/eslintrc",
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

return { json = { schemas = json_schemas } }

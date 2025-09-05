---@type vim.lsp.Config
return {
	settings = {
		yaml = { schemas = require("schemastore").yaml.schemas() },
		redhat = {
			telemetry = { enabled = false },
		},
	},
}

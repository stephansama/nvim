---@type vim.lsp.Config
local M = {}

local original = require("lspconfig.configs.tailwindcss").default_config

M.settings =
	{
		tailwindCSS = vim.tbl_deep_extend(
			"force",
			original.settings.tailwindCSS,
			require("utils.tailwindcss").getLocalTailwindSettings()
		),
	}

return vim.tbl_deep_extend("force", original, M)

---@type vim.lsp.Config
local M = {}

local original = require("lspconfig.configs.tailwindcss").default_config

local user_settings =
	require("utils.tailwindcss").getLocalTailwindSettings().tailwindCSS or {}

M.settings =
	{
		tailwindCSS = vim.tbl_deep_extend(
			"force",
			original.settings,
			user_settings
		),
	}

return vim.tbl_deep_extend("force", original, M)

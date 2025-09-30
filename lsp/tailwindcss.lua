---@type vim.lsp.Config
local M = {}

M.settings =
	{ tailwindCSS = require("utils.tailwindcss").getLocalTailwindSettings() }

return M

---@type vim.lsp.Config
local M = {}

M.init_options = {
	vue = { hybridMode = false },
	typescript = { tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib" },
}

return M

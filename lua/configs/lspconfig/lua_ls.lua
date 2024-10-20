local M = {}
local library = {
	[vim.fn.expand("$VIMRUNTIME/lua")] = true,
	[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
	[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
	[vim.fn.stdpath("data") .. "/lazy"] = true,
}

---@param client unknown
---@param bufnr unknown
---@param on_attach function
M.on_attach = function(client, bufnr, on_attach)
	on_attach(client, bufnr)
	require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
end

M.Lua = {
	hint = { enable = true },
	diagnostics = { globals = { "vim" } },
	workspace = {
		library = library,
		maxPreload = 100000,
		preloadFileSize = 10000,
	},
}

return M

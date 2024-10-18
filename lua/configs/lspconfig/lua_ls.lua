local M = {}
local library = {
	[vim.fn.expand("$VIMRUNTIME/lua")] = true,
	[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
	[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
}

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

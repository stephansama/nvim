local expand_settings = require("utils").expand_settings

expand_settings({
	o = { scrolloff = 8, shiftwidth = 4 },
	wo = { number = true, relativenumber = true },
	bo = { tabstop = 4 },
	opt = {
		clipboard = "unnamedplus",
		signcolumn = "yes",
		splitbelow = false,
		splitright = true,
		conceallevel = 1,
		foldmethod = "expr",
		foldlevel = 99,
		foldexpr = "nvim_treesitter#foldexpr()",
		tabstop = 4,
	},
})

vim.filetype.add({
	extension = {
		mdx = "markdown",
		pcss = "css",
		postcss = "css",
	},
})

-- WARN: remove with lsp-inlayhints
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = "LspAttach_inlayhints",
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end

		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		require("lsp-inlayhints").on_attach(client, bufnr)

		vim.cmd([[hi LspInlayHint guifg=#646464 guibg=none]])
	end,
})

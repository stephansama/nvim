vim.o.scrolloff = 8
vim.o.shiftwidth = 4
vim.bo.tabstop = 4
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.conceallevel = 1
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"
vim.opt.foldmethod = "expr"
vim.opt.clipboard = "unnamedplus"
vim.opt.foldlevel = 5
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.tabstop = 4

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

vim.filetype.add({
	extension = {
		postcss = "css",
		pcss = "css",
	},
})

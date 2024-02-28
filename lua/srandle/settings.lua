vim.o.scrolloff = 8
vim.wo.number = true
vim.wo.relativenumber = true
vim.bo.tabstop = 4

vim.opt.conceallevel = 1
vim.opt.signcolumn = "yes"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 5

vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"

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

vim.cmd([[hi DashboardHeader guifg=#782021 guibg=none]])

vim.filetype.add({
	extension = {
		postcss = "css",
		pcss = "css",
	},
})

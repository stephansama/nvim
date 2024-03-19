local expand_settings = require("utils").expand_settings

expand_settings({
	wo = { number = true, relativenumber = true },
	bo = { tabstop = 4 },
	o = {
		scrolloff = 8,
		shiftwidth = 4,
		fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]], -- fold seperator
	},
	opt = {
		clipboard = "unnamedplus", -- use system register
		signcolumn = "yes", -- always show sign column to prevent layout shift
		splitbelow = false,
		splitright = true,
		conceallevel = 1,
		tabstop = 4,
		-- https://github.com/kevinhwang91/nvim-ufo?tab=readme-ov-file#minimal-configuration
		foldlevel = 99,
		foldcolumn = "1",
		foldenable = true,
		foldlevelstart = 99,
	},
})

vim.filetype.add({
	extension = {
		templ = "templ",
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

		vim.cmd([[UfoEnableFold]])
		vim.cmd([[hi LspInlayHint guifg=#646464 guibg=none]])
	end,
})

local expand_settings = require("utils").expand_settings

expand_settings({
	wo = { number = true, relativenumber = true },
	bo = { tabstop = 4 },
	o = {
		list = true,
		listchars = "tab:│ ,trail:·",
		scrolloff = 8,
		shiftwidth = 4,
		fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]], -- fold seperator
	},
	opt = {
		tabstop = 4,
		confirm = true,
		undofile = true,
		wildmode = "longest:full,full",
		smartcase = true,
		clipboard = "unnamedplus", -- use system register
		undolevels = 10000,
		signcolumn = "yes", -- always show sign column to prevent layout shift
		splitbelow = false,
		splitright = true,
		smartindent = true,
		conceallevel = 1,
		termguicolors = true,
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
	end,
})

local expand_settings = require("utils").expand_settings

expand_settings({
	wo = { number = true, relativenumber = true },
	bo = { tabstop = 4 },
	o = {
		list = true,
		shiftwidth = 4,
		scrolloff = 999,
		listchars = "tab:│ ,trail:·",
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
		zsh = "sh",
		pcss = "css",
		postcss = "css",
	},
})

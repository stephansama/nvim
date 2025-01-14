local ft = require("constants.ft")
local VIM_FT_EXTENSIONS, VIM_FT_FILENAMES = ft.VIM_FT_EXTENSIONS, ft.VIM_FT_FILENAMES
local expand_settings = require("utils.expand").expand_settings

vim.g.mapleader = require("keys.init").LEADER

vim.filetype.add({
	filename = VIM_FT_FILENAMES,
	extension = VIM_FT_EXTENSIONS,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.cmd([[set shortmess+=I]])

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
		-- cmdheight = 0,
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

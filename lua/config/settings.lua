local constants = require("config.constants")

vim.filetype.add({
	extension = constants.VIM_FT_EXTENSIONS,
	filename = constants.VIM_FT_FILENAMES,
	pattern = constants.VIM_FT_PATTERNS,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

---> autocmd to underline all links <---
vim.cmd([[autocmd BufEnter * match Underlined /https\?:\/\/\S\+/]])
vim.cmd([[set shortmess+=I]])

vim.g.mapleader = constants.LEADER

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.list = true
vim.o.shiftwidth = 4
vim.o.scrolloff = 999
vim.o.listchars = "tab:│ ,trail:·"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.tabstop = 4
vim.opt.confirm = true
vim.opt.undofile = true
vim.opt.wildmode = "longest:full,full"
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
vim.opt.undolevels = 10000
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = false
vim.opt.splitright = true
vim.opt.smartindent = true
vim.opt.conceallevel = 1
vim.opt.termguicolors = true
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99

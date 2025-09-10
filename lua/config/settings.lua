local constants = require("config.constants")

vim.filetype.add({
	extension = constants.VIM_FT_EXTENSIONS,
	filename = constants.VIM_FT_FILENAMES,
	pattern = constants.VIM_FT_PATTERNS,
})

vim.g.mapleader = constants.LEADER
vim.g.maplocalleader = constants.LEADER

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.list = true
vim.o.listchars = "tab:│ ,trail:·"
vim.o.scrolloff = 999
vim.o.shiftwidth = 4
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.conceallevel = 1
vim.opt.confirm = true
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.shortmess:append("I") -- remove initial splash screen
vim.opt.signcolumn = "yes" -- always show sign colum to prevent layout shift
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = false
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.wildmode = "longest:full,full"
vim.wo.number = true
vim.wo.relativenumber = true

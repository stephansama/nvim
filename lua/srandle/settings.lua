vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.g.mapleader = " "

vim.cmd([[set shortmess+=I]])

vim.wo.number = true
vim.wo.relativenumber = true

vim.bo.tabstop = 4

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.list = true
vim.o.listchars = "tab:│ ,trail:·"
vim.o.scrolloff = 999
vim.o.shiftwidth = 4

vim.opt.clipboard = "unnamedplus" -- use system register
vim.opt.conceallevel = 1
vim.opt.confirm = true
vim.opt.signcolumn = "yes" -- always show sign column to prevent layout shift
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = false
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
-- vim.opt.wildmode = "longest:fullfull"

-- https://github.com/kevinhwang91/nvim-ufo?tab=readme-ov-file#minimal-configuration
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

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

local function reset_ui()
	if package.preload["ufo"] then
		vim.cmd([[UfoEnableFold]])
	end

	vim.cmd([[hi FloatBorder guifg=White guibg=none]])
	vim.cmd([[hi LspInlayHint guifg=#646464 guibg=none]])
	vim.cmd([[hi MiniIndentscopeSymbol guifg=#C93638 guibg=none]])
	vim.cmd([[hi NoiceCmdlinePopupBorder guifg=#C93638 guibg=none]])
	vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
	vim.cmd(
		[[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
	)

	if package.preload["dashboard"] then
		vim.cmd([[ColorDashboard]])
	end
end

vim.api.nvim_create_user_command("ResetUI", reset_ui, { nargs = 0 })

vim.cmd([[autocmd BufEnter * match Underlined /https\?:\/\/\S\+/]])
vim.cmd([[set shortmess+=I]])

vim.g.mapleader = constants.LEADER

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.list = true
vim.o.listchars = "tab:│ ,trail:·"
vim.o.scrolloff = 999
vim.o.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 1
vim.opt.confirm = true
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.signcolumn = "yes"
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

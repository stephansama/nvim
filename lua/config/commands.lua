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

--- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--- highlight all links
vim.cmd([[autocmd BufEnter * match Underlined /https\?:\/\/\S\+/]])

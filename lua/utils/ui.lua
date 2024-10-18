local M = {}

M.reset_ui = function()
	vim.cmd([[hi FloatBorder guifg=White guibg=none]])
	vim.cmd([[hi LspInlayHint guifg=#646464 guibg=none]])
	vim.cmd([[hi MiniIndentscopeSymbol guifg=#C93638 guibg=none]])
	vim.cmd([[hi NoiceCmdlinePopupBorder guifg=#C93638 guibg=none]])
	vim.cmd([[UfoEnableFold]])

	vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
	vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

	require("utils.dashboard").color_dashboard()
end

--- create border for highlight group
---@param hl_name string Highlight group name
---@return table border_table of border elements
M.border = function(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

return M

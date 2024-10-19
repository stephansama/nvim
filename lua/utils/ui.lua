local M = {}

M.override_builtins = function(builtins)
	for _, builtin in pairs(builtins) do
		vim.ui[builtin] = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui[builtin](...)
		end
	end
end

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

---automatically switch between light and dark mode
---@param theme ('dark'|'light')
---@return function
M.auto_theme = function(theme)
	local themes = require("constants.theme")
	local selected = theme == "dark" and themes.THEME_DARKMODE or themes.THEME_LIGHTMODE
	return function()
		vim.api.nvim_set_option_value("background", theme, {})
		vim.cmd(string.format("colorscheme %s", selected))
		M.reset_ui()
	end
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

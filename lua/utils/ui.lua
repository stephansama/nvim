local M = {}

M.lualine_macros = function()
	return require("NeoComposer.ui").status_recording()
end

M.lualine_package_info = function()
	return require("package-info").get_status()
end

M.setup_sign_icons = function(icons, hl_callback)
	for type, icon in pairs(icons) do
		local hl = hl_callback(type)
		vim.fn.sign_define(hl, {
			text = icon,
			texthl = hl,
			numhl = hl,
		})
	end
end

M.override_builtins = function(builtins)
	for _, builtin in pairs(builtins) do
		vim.ui[builtin] = function(...)
			require("lazy").load({
				plugins = { "dressing.nvim" },
			})
			return vim.ui[builtin](...)
		end
	end
end

--- create nvim-lspconfig catppuccin options
---@param type string
---@return table
M.create_theme_options = function(type)
	return {
		hints = { type },
		errors = { type },
		warnings = { type },
		information = { type },
	}
end

M.reset_ui = function()
	if package.preload["ufo"] then
		vim.cmd([[UfoEnableFold]])
	end

	vim.cmd([[hi FloatBorder guifg=White guibg=none]])
	vim.cmd([[hi LspInlayHint guifg=#646464 guibg=none]])
	vim.cmd([[hi MiniIndentscopeSymbol guifg=#C93638 guibg=none]])
	vim.cmd([[hi NoiceCmdlinePopupBorder guifg=#C93638 guibg=none]])
	vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
	vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

	require("utils.dashboard").color_dashboard()
end

---automatically switch between light and dark mode
---@param theme string
---@return function
M.auto_theme = function(theme)
	local themes = require("constants.init")
	local is_darkmode = theme == themes.THEME_DARKMODE
	return function()
		vim.api.nvim_set_option_value("background", is_darkmode and "dark" or "light", {})
		vim.cmd(string.format("colorscheme %s", theme))
		if is_darkmode then
			vim.cmd([[hi BqfPreviewFloat guibg=#1e1e2e]])
			vim.cmd([[hi BqfPreviewTitle guibg=#1e1e2e]])
			vim.cmd([[hi BqfPreviewBorder guibg=#1e1e2e]])
		end
		M.reset_ui()
	end
end

--- create border for highlight group
---@param hl_name string Highlight group name
---@return table<table<string,string>> border_table of border elements
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

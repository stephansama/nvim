local theme = require("config.constants")

local function auto_theme(current_theme)
	local is_darkmode = current_theme == theme.THEME_DARKMODE
	return function()
		local next_theme = is_darkmode and "dark" or "light"
		vim.api.nvim_set_option_value("background", next_theme, {})

		vim.cmd(string.format("colorscheme %s", current_theme))

		if is_darkmode then
			vim.cmd([[hi BqfPreviewFloat guibg=#1e1e2e]])
			vim.cmd([[hi BqfPreviewTitle guibg=#1e1e2e]])
			vim.cmd([[hi BqfPreviewBorder guibg=#1e1e2e]])
		end

		vim.cmd([[ResetUI]])
	end
end

return {
	"f-person/auto-dark-mode.nvim",
	priority = 1002,
	lazy = false,
	opts = {
		update_interval = 1000,
		set_dark_mode = auto_theme(theme.THEME_DARKMODE),
		set_light_mode = auto_theme(theme.THEME_LIGHTMODE),
	},
}

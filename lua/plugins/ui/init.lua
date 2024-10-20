local utils = require("utils.ui")

return {
	{
		"catppuccin/nvim",
		priority = 1000,
		name = "catppuccin",
		opts = function()
			return require("configs.catppuccin")
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return require("configs.icons.devicons")
		end,
	},
	{ "szw/vim-maximizer", keys = require("keys.init").maximizer },
	{ "chentoast/marks.nvim", event = "VimEnter", opts = { sign_priority = 90 } },
	{ "stevearc/dressing.nvim", init = utils.override_builtins({ "select", "input" }) },
	{
		"f-person/auto-dark-mode.nvim",
		priority = 999,
		lazy = false,
		opts = {
			update_interval = 1000,
			set_dark_mode = utils.auto_theme("dark"),
			set_light_mode = utils.auto_theme("light"),
		},
	},
}

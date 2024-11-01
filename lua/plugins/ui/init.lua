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
	{
		"rcarriga/nvim-notify",
		lazy = false,
		keys = require("keys.init").notify,
		init = function()
			vim.notify = require("notify")
		end,
		---@module "notify"
		---@type notify.Config
		opts = {
			stages = "static",
			render = "compact",
			fps = 30,
			level = vim.log.levels.INFO,
			timeout = 2000,
			on_open = function() end,
			on_close = function() end,
			max_width = 50,
			max_height = 3,
			minimum_width = 50,
			top_down = true,
			icons = require("configs.icons").notify,
			background_colour = "NotifyBackground",
			time_formats = { notification_history = "%FT%T", notification = "%T" },
		},
	},
}

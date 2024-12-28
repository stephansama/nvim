local utils = require("utils.ui")

return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return require("configs.icons.devicons")
		end,
	},
	{ "szw/vim-maximizer", keys = require("keys.init").maximizer },
	{ "chentoast/marks.nvim", event = "VeryLazy", opts = { sign_priority = 90 } },
	{ "stevearc/dressing.nvim", init = utils.override_builtins({ "select", "input" }) },
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
			fps = 30,
			icons = require("configs.icons").notify,
			level = vim.log.levels.INFO,
			render = "compact",
			stages = "static",
			timeout = 2000,
			on_open = function() end,
			on_close = function() end,
			top_down = true,
			max_width = 50,
			max_height = 3,
			time_formats = { notification_history = "%FT%T", notification = "%T" },
			minimum_width = 50,
			background_colour = "NotifyBackground",
		},
	},
}

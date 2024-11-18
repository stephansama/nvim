---@module "notify"
---@type notify.Config
local opts = {
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
	max_height = 5,
	time_formats = { notification_history = "%FT%T", notification = "%T" },
	minimum_width = 50,
	background_colour = "NotifyBackground",
}

return {
	"rcarriga/nvim-notify",
	opts = opts,
	lazy = false,
	keys = require("keys.init").notify,
	init = function()
		vim.notify = require("notify")
	end,
}

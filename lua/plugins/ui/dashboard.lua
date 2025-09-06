local constants = require("config.constants")

vim.api.nvim_create_user_command(
	"ColorDashboard",
	function()
		math.randomseed(os.time())
		local COLORS =
			vim.g.colors_name == constants.THEME_DARKMODE and constants.DASHBOARD_DARKMODE or constants.DASHBOARD_LIGHTMODE
		local selected = COLORS[math.random(#COLORS)]
		vim.cmd("hi DashboardHeader guibg=none guifg=" .. selected)
	end,
	{ nargs = 0 }
)

vim.api.nvim_create_user_command(
	"GoToDashboard",
	function()
		vim.cmd([[ColorDashboard]])
		vim.cmd([[bufdo bd!]])
		vim.cmd([[Dashboard]])
	end,
	{ nargs = 0 }
)

local opts = {
	theme = "hyper",
	change_to_vcs_root = true,
	shortcut_type = "number",
	disable_move = true,
	config = {
		shortcut = require("plugins.ui.dashboard.shortcuts").shortcuts,
		header = require("plugins.ui.dashboard.ascii").loadAscii(),
		footer = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return {
				" loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
			}
		end,
		mru = {
			enable = true,
			limit = 9,
			icon = " ",
			label = "Files",
			cwd_only = true,
		},
		project = { enable = false },
		packages = { enable = false },
	},
}

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	keys = require("keys.plugin").dashboard,
	opts = opts,
}

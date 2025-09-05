local constants = require("config.constants")

local opts = {
	theme = "hyper",
	change_to_vcs_root = true,
	shortcut_type = "number",
	disable_move = true,
	config = {
		shortcut = require("plugins.ui.dashboard.shortcuts").shortcuts,
		header = require("utils.dashboard").load_ascii_headers(
			constants.ASCII_DIR,
			"txt"
		),
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

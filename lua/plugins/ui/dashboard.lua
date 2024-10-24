local ASCII_DIR = require("constants.dir").ASCII_DIR
local utils = require("utils.dashboard")
local expand_actions, load_ascii_headers = utils.expand_actions, utils.load_ascii_headers

local config = {
	header = load_ascii_headers(ASCII_DIR, "txt"),
	footer = function()
		local stats = require("lazy").stats()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		return { " loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
	end,
	center = expand_actions(require("keys.init").dashboard_actions),
}

local opts = { theme = "doom", config = config }

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = opts,
	keys = require("keys.init").dashboard,
}

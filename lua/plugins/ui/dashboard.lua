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
	center = expand_actions({
		{ " ", "f", "Find  file", "Telescope find_files" },
		{ " ", "r", "Find  recent", "Telescope oldfiles" },
		{ " ", "t", "Find  tmux window", "Telescope tmux windows theme=ivy" },
		{ " ", "q", "Quit", "qa" },
	}),
}

local opts = { theme = "doom", config = config }

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = opts,
	keys = require("keys.init").dashboard,
}

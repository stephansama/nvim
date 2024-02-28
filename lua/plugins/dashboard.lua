local header = {
	"        ▄▄▄▄▄███████████████████▄▄▄▄▄     ",
	"      ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄   ",
	"     █▀████████▄             ▀▀████ ▀██▄  ",
	"    █▄▄██████████████████▄▄▄         ▄██▀ ",
	"     ▀█████████████████████████▄    ▄██▀  ",
	"       ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀    ",
	"         ▀███▄              ▀██████▀      ",
	"           ▀██████▄        ▄████▀         ",
	"              ▀█████▄▄▄▄▄▄▄███▀           ",
	"                ▀████▀▀▀████▀             ",
	"                  ▀███▄███▀               ",
	"                     ▀█▀                  ",
}

local options = {
	config = {
		project = {
			enable = true,
			limit = 4,
			label = "Recent directories",
			action = "Telescope find_files cwd=",
		},
		mru = { limit = 5 },
		footer = { "We have the technology" },
		header = header,
	},
}

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = function()
		require("dashboard").setup(options)
	end,
}

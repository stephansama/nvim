return {
	{ "rest-nvim/rest.nvim", keys = require("keys.plugin").rest, ft = "http" },
	{ "windwp/nvim-ts-autotag", ft = require("constants.ft").WEB_FILETYPES, config = true },
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = { enable_autocmd = false },
		config = true,
	},
	{
		"vuki656/package-info.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = true,
		lazy = false,
		ft = "json",
		opts = {
			package_manager = "pnpm",
			hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
			hide_unstable_versions = true,
			colors = require("constants.theme").PACKAGE_INFO_COLORS,
			icons = { enable = true, style = require("icons").packageJSON },
		},
	},
	{
		"barrett-ruth/live-server.nvim",
		config = true,
		build = "pnpm add -g live-server",
		keys = require("keys.plugin").liveserver,
		cmd = { "LiveServerStart", "LiveServerStop" },
	},
}

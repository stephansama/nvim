return {
	{ "rest-nvim/rest.nvim", keys = require("keys.init").rest, ft = "http" },
	{ "themaxmarchuk/tailwindcss-colors.nvim", config = true },
	{ "windwp/nvim-ts-autotag", ft = require("constants.ft").WEB_FILETYPES, config = true },
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = { enable_autocmd = false },
		config = true,
	},
	{
		"Equilibris/nx.nvim",
		config = true,
		keys = require("keys.init").telescope_nx,
		opts = { nx_cmd_root = "npx nx" },
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"vuki656/package-info.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = true,
		lazy = false,
		opts = {
			package_manager = "pnpm",
			hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
			hide_unstable_versions = true,
			colors = require("constants.theme").PACKAGE_INFO_COLORS,
			icons = { enable = true, style = require("configs.icons").packageJSON },
		},
	},
	{
		"barrett-ruth/live-server.nvim",
		config = true,
		build = "pnpm add -g live-server",
		keys = require("keys.init").liveserver,
		cmd = { "LiveServerStart", "LiveServerStop" },
	},
}

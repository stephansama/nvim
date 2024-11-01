local opts = {
	package_manager = "pnpm",
	hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
	hide_unstable_versions = true,
	colors = require("constants.theme").PACKAGE_INFO_COLORS,
	icons = { enable = true, style = require("configs.icons").packageJSON },
}

return {
	{
		"vuki656/package-info.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		config = true,
		lazy = false,
		opts = opts,
	},
	{
		"barrett-ruth/live-server.nvim",
		config = true,
		build = "pnpm add -g live-server",
		keys = require("keys.init").liveserver,
		cmd = { "LiveServerStart", "LiveServerStop" },
	},
}

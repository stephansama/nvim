local ft = require("utils.globals").web_filetypes

return {
	{ "ellisonleao/dotenv.nvim" },
	{ "mattn/emmet-vim", ft = ft },
	{ "themaxmarchuk/tailwindcss-colors.nvim", config = true },
	{
		"vuki656/package-info.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		-- event = { "BufRead package.json" },
		-- for whatever reason cannot get colors to work unless the package is not lazy loaded
		lazy = false,
		config = true,
		opts = {
			-- use the same colors as crates.nvim
			-- autostart = true, -- Whether to autostart when `package.json` is opened
			hide_unstable_versions = true,
			hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
			package_manager = "pnpm",
			colors = { up_to_date = "#9CDAE9", outdated = "#F5E3B5" },
			icons = {
				enable = true, -- Whether to display icons
				style = {
					up_to_date = "|  ", -- Icon for up to date dependencies
					outdated = "|  ", -- Icon for outdated dependencies
				},
			},
		},
	},
}

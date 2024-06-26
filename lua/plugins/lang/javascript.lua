return {
	{
		"vuki656/package-info.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		-- event = { "BufRead package.json" },
		-- for whatever reason cannot get colors to work unless the package is not lazy loaded
		lazy = false,
		config = true,
		opts = { -- use the same colors and icons as [crates.nvim](https://github.com/Saecki/crates.nvim)
			icons = { enable = true, style = require("configs.icons").packageJSON },
			colors = { up_to_date = "#9CDAE9", outdated = "#F5E3B5" },
			package_manager = "pnpm",
			hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
			hide_unstable_versions = true,
		},
	},
}

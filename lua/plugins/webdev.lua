local ft = require("utils.globals").web_filetypes

return {
	{ "ellisonleao/dotenv.nvim" },
	{ "mattn/emmet-vim", ft = ft },
	{ "themaxmarchuk/tailwindcss-colors.nvim", config = true },
	{
		"vuki656/package-info.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		ft = { "json" },
		opts = {
			colors = {
				up_to_date = "#9CDAE9", -- Text color for up to date dependency virtual text
				outdated = "#F5E3B5", -- Text color for outdated dependency virtual text
			},
			icons = {
				enable = true, -- Whether to display icons
				style = {
					up_to_date = "|  ", -- Icon for up to date dependencies
					outdated = "|  ", -- Icon for outdated dependencies
				},
			},
			hide_unstable_versions = true,
			hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
			package_manager = "pnpm",
			autostart = true, -- Whether to autostart when `package.json` is opened
		},
		config = function(_, opts)
			require("package-info").setup(opts)
		end,
	},
}

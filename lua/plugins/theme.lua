return {
	{ "rebelot/kanagawa.nvim", lazy = false, opts = { transparent = true } },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		opts = { transparent_background = true },
		priority = 1000,
		init = function()
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					-- section_separators = { left = "", right = "" },
					-- component_separators = { left = "", right = "" },
				},
			})
		end,
	},
	{
		"gelguy/wilder.nvim",
		lazy = false,
		dependencies = { "romgrk/fzy-lua-native" },
		config = function()
			require("plugins.configs.wilder")
		end,
	},
}

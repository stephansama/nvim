return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		lazy = false,
		init = function()
			require("onedarkpro").setup({
				options = {
					transparency = true,
				},
			})
			vim.cmd([[colorscheme onedark]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			require("lualine").setup({
				options = {
					theme = "onedark",
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

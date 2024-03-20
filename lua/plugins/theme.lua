local filename_symbols = {
	modified = "",
	readonly = "",
	unnamed = "󰡯",
	newfile = "",
}

local lualine_opts = {
	options = {
		globalstatus = true,
		theme = "catppuccin",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_c = {
			{
				"filename",
				file_status = true,
				newfile_status = true,
				path = 3,
				symbols = filename_symbols,
			},
		},
	},
}

return {
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
		opts = lualine_opts,
	},
	{
		"gelguy/wilder.nvim",
		lazy = false,
		dependencies = { "romgrk/fzy-lua-native" },
		config = function()
			require("configs.wilder-conf")
		end,
	},
}

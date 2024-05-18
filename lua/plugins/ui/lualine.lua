local filename_symbols = {
	modified = "",
	readonly = "",
	unnamed = "󰡯",
	newfile = "",
}

local opts = {
	options = {
		theme = "catppuccin",
		globalstatus = true,
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
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = opts,
}

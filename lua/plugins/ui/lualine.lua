local filename_symbols = {
	modified = "",
	readonly = "",
	unnamed = "󰡯",
	newfile = "",
}

local package_info = function()
	return require("package-info").get_status()
end

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
			{ package_info },
		},
	},
}

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = opts,
}

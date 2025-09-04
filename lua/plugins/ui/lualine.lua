local utils = require("utils.ui")

local blank_separators = {
	left = "",
	right = "",
}

---@see Default_Configuration https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#default-configuration
local opts = {
	options = {
		theme = require("constants").THEME,
		globalstatus = true,
		disabled_filetypes = { "dashboard" },
		section_separators = blank_separators,
		component_separators = blank_separators,
	},
	sections = {
		lualine_c = { {
			"filename",
			file_status = true,
			newfile_status = true,
			path = 3,
			symbols = require("icons").lualine,
		}, { utils.lualine_package_info } },
		lualine_x = { utils.lualine_macros, "fileformat", "filetype" },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = opts,
}

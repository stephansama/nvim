local utils = require("utils.ui")

---@see Default_Configuration https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#default-configuration
local opts = {
	options = {
		theme = require("constants.theme").THEME,
		globalstatus = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		{ disabled_filetypes = { "dashboard" } },
	},
	sections = {
		lualine_c = {
			{
				"filename",
				file_status = true,
				newfile_status = true,
				path = 3,
				symbols = require("icons").lualine,
			},
			-- { utils.lualine_package_info },
		},
		lualine_x = { utils.lualine_macros, "fileformat", "filetype" },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = opts,
}

local blank_separators = {
	left = "",
	right = "",
}

---@see Default_Configuration https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#default-configuration
local opts = {
	options = {
		theme = require("config.constants").THEME,
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
		}, { function()
			return require("package-info").get_status()
		end } },
		lualine_x = { function()
			return require("NeoComposer.ui").status_recording()
		end, "fileformat", "filetype" },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = opts,
}

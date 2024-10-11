local macros = function()
	return require("NeoComposer.ui").status_recording()
end

local package_info = function()
	return require("package-info").get_status()
end

---@see Default_Configuration https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#default-configuration
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
				symbols = require("configs.icons").lualine,
			},
			{ package_info },
		},
		lualine_x = { macros, "fileformat", "filetype" },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = opts,
}

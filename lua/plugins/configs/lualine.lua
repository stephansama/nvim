local custom_onedark = require("lualine.themes.onedark")

-- Change the background of lualine_c section for normal mode
custom_onedark.normal.c.bg = "#11223300"

require("lualine").setup({
	options = {
		theme = custom_onedark,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
	},
})

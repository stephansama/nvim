local M = {}

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowGreen",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowViolet",
	"RainbowCyan",
}

M.opts = { indent = { highlight = highlight } }
-- M.opts = {
-- 	-- indentLine_enabled = 1,
-- 	filetype_exclude = {
-- 		"help",
-- 		"terminal",
-- 		"lazy",
-- 		"lspinfo",
-- 		"TelescopePrompt",
-- 		"TelescopeResults",
-- 		"mason",
-- 		"nvdash",
-- 		"nvcheatsheet",
-- 		"",
-- 	},
-- 	buftype_exclude = { "terminal" },
-- 	-- show_trailing_blankline_indent = false,
-- 	-- show_first_indent_level = false,
-- 	-- show_current_context = true,
-- 	-- show_current_context_start = true,
-- }

M.config = function(opts)
	local hooks = require("ibl.hooks")
	-- create the highlight groups in the highlight setup hook, so they are reset
	-- every time the colorscheme changes
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#8a0f19" })
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#ba8013" })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#3d820a" })
		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
		vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
		vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
	end)

	require("ibl").setup(opts)
end

return M

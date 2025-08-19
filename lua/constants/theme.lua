local M = {}

M.THEME = "catppuccin"
M.THEME_DARKMODE = "catppuccin-mocha"
M.THEME_LIGHTMODE = "catppuccin-latte"

---@see CratesDocumentation https://github.com/Saecki/crates.nvim
M.PACKAGE_INFO_COLORS = {
	up_to_date = "#9CDAE9",
	outdated = "#F5E3B5",
}

M.DASHBOARD_LIGHTMODE = {
	"#dc8a78",
	"#dd7878",
	"#ea76cb",
	"#8839ef",
	"#d20f39",
	"#e64553",
	"#fe640b",
	"#df8e1d",
	"#40a02b",
	"#179299",
	"#04a5e5",
	"#209fb5",
	"#1e66f5",
	"#7287fd",
	"#5c5f77",
}

M.DASHBOARD_DARKMODE = {
	"#F5E0DC",
	"#F2CDCD",
	"#F5C2E7",
	"#CBA6F7",
	"#F38BA8",
	"#EBA0AC",
	"#FAB387",
	"#F9E2AF",
	"#A6E3A1",
	"#94E2D5",
	"#89DCEB",
	"#74C7EC",
	"#89B4FA",
	"#B4BEFE",
}

M.DASHBOARD_COLORS = function()
	if vim.g.colors_name == M.THEME_DARKMODE then
		return M.DASHBOARD_DARKMODE
	end
	return M.DASHBOARD_LIGHTMODE
end

return M

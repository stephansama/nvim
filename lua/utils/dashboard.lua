local M = {}

M.color_dashboard = function()
	math.randomseed(os.time())
	local const = require("config.constants")
	local COLORS =
		vim.g.colors_name == const.THEME_DARKMODE and const.DASHBOARD_DARKMODE or const.DASHBOARD_LIGHTMODE
	local selected = COLORS[math.random(#COLORS)]
	vim.cmd("hi DashboardHeader guibg=none guifg=" .. selected)
end

M.go_to_dashboard = function()
	M.color_dashboard()
	vim.cmd([[bufdo bd!]])
	vim.cmd.Dashboard()
end

if not _G.GoToDashboardLoaded then
	_G.GoToDashboardLoaded = true
	vim.api.nvim_create_user_command("GoToDashboard", M.go_to_dashboard, {
		nargs = 0,
	})
end

M.load_ascii_headers = function(directory)
	local ascii_images = {}
	local ascii_image_filenames = vim.fn.readdir(directory)

	if ascii_image_filenames then
		for _, entry in ipairs(ascii_image_filenames) do
			local full_path = directory .. entry
			if vim.fn.filereadable(full_path) == 1 then
				ascii_images[#ascii_images + 1] = full_path
			end
		end
	end

	math.randomseed(os.time())

	local random = math.random(#ascii_images)
	local picked_file = ascii_images[random]
	return vim.fn.readfile(picked_file)
end

return M

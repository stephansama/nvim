local M = {}

M.color_dashboard = function()
	math.randomseed(os.time())
	local const = require("constants.init")
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

M.load_ascii_headers = function(directory, extension)
	local dir = io.popen("ls " .. directory, "r")
	local images = {}

	if not dir then
		print("failed to load ascii image directory")
		return {}
	end

	for file in dir:lines() do
		local after_period = string.match(file, "%.(.+)")
		if after_period == extension then
			images[#images + 1] = file
		end
	end

	math.randomseed(os.time())

	local file = {}
	local random = math.random(#images)
	local picked_file = images[random]
	local opened_file = io.open(directory .. picked_file)

	if opened_file then
		for line in opened_file:lines() do
			file[#file + 1] = line
		end
	else
		print("failed to load ascii image file")
	end

	return file
end

return M

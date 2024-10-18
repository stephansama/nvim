local M = {}

M.expand_actions = require("utils.expand").expand_actions

M.color_dashboard = function()
	local DASHBOARD_COLORS = require("constants.colors").DASHBOARD_COLORS
	math.randomseed(os.time())
	local selected = DASHBOARD_COLORS[math.random(#DASHBOARD_COLORS)]
	vim.cmd("hi DashboardHeader guibg=none guifg=" .. selected)
end

M.load_ascii_headers = function(directory, extension)
	local dir = io.popen("ls " .. directory, "r")
	local images = {}
	if dir then
		for file in dir:lines() do
			local after_period = string.match(file, "%.(.+)")
			if after_period == extension then
				images[#images + 1] = file
			end
		end
	else
		print("failed to load ascii image directory")
		return {}
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

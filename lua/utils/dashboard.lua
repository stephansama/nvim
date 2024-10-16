local M = {}

M.expand_actions = require("utils.expand").expand_actions

M.color_dashboard = function()
	local dashboard_colors = {
		"#f5e0dc",
		"#f2cdcd",
		"#f5c2e7",
		"#cba6f7",
		"#f38ba8",
		"#eba0ac",
		"#fab387",
		"#f9e2af",
		"#a6e3a1",
		"#94e2d5",
		"#89dceb",
		"#74c7ec",
		"#89b4fa",
		"#b4befe",
	}
	math.randomseed(os.time())
	local selected = dashboard_colors[math.random(#dashboard_colors)]
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

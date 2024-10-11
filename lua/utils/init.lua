return {
	--- launch url dependent on system
	---@param url string
	---@return nil
	openURL = function(url)
		if url == "" then
			return
		end
		vim.cmd("exec \"!open '" .. url .. "'\"")
	end,
	--- create border for highlight group
	---@param hl_name string Highlight group name
	---@return table border_table of border elements
	border = function(hl_name)
		return {
			{ "╭", hl_name },
			{ "─", hl_name },
			{ "╮", hl_name },
			{ "│", hl_name },
			{ "╯", hl_name },
			{ "─", hl_name },
			{ "╰", hl_name },
			{ "│", hl_name },
		}
	end,

	--- Create plugin paths list
	---@param enabled_plugins table list of enabled plugins directories relative to plugins folder
	---@return table paths list of plugin paths
	plugins = function(enabled_plugins)
		local root = "plugins"
		local paths = { { import = root } }
		for _, plugin in ipairs(enabled_plugins) do
			table.insert(paths, { import = root .. "." .. plugin })
		end
		return paths
	end,

	---used for `keymaps.lua`
	---expand keymap object into its respective keymapping
	---should take the form of
	---```lua
	---local keymaps = {
	---	n = {
	---		["<leader>A"] = { vim.cmd.Command, "description" }
	---	}
	---}
	---expand_keymaps(keymaps)
	---```
	---@param keymappings table
	---@return nil
	expand_keymaps = function(keymappings)
		for mode, keybindings in pairs(keymappings) do
			for key, info in pairs(keybindings) do
				vim.keymap.set(
					mode,
					key,
					info[1],
					vim.tbl_deep_extend("force", { desc = info[2] or "" }, info[3] or {})
				)
			end
		end
	end,

	---used for `settings.lua`
	---expand settings object into its respective vim/nvim setting
	---@param settings table
	---@return nil
	expand_settings = function(settings)
		for option_type, options in pairs(settings) do
			for setting, val in pairs(options) do
				vim[option_type][setting] = val
			end
		end
	end,

	---used for `dashboard.lua`
	---expand actions object into the proper shape
	---order of action is as follows
	---
	--- `{ "icon", "key", "desc", "action" }`
	---@param actions table
	---@return table
	expand_actions = function(actions)
		local response = {}
		local mappings = { "icon", "key", "desc", "action" }
		for i, action in ipairs(actions) do
			table.insert(response, {})
			for k, val in ipairs(action) do
				response[i][mappings[k]] = val
			end
		end
		return response
	end,

	---Capture extension from filename
	---@param filepath string
	---@return string
	capture_after_first_period_in_filename = function(filepath)
		-- Extract the filename from the full path using patterns
		local filename = filepath:match("([^/]+)$")
		-- Apply the previous function to capture content after the first period in the filename
		local after_period = string.match(filename, "%.(.+)")
		return after_period or filename or ""
	end,

	color_dashboard = function()
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
	end,

	load_ascii_headers = function(directory, extension)
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
	end,
}

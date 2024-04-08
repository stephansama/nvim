return {
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
}

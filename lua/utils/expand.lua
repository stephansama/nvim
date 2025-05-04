local M = {}

--- Create plugin paths list
---@param enabled_plugins table list of enabled plugins directories relative to plugins folder
---@return table paths list of plugin paths
M.expand_plugins = function(enabled_plugins)
	local root = "plugins"
	local paths = { { import = root .. ".init" } }
	for _, plugin in ipairs(enabled_plugins) do
		table.insert(paths, { import = root .. "." .. plugin })
	end
	return paths
end

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
M.expand_keymaps = function(keymappings, common_options)
	for mode, keybindings in pairs(keymappings) do
		for key, info in pairs(keybindings) do
			vim.keymap.set(
				mode,
				key,
				info[1],
				vim.tbl_deep_extend("force", { desc = info[2] or "" }, info[3] or common_options or {})
			)
		end
	end
end

---used for `settings.lua`
---expand settings object into its respective vim/nvim setting
---@param settings table
---@return nil
M.expand_settings = function(settings)
	for option_type, options in pairs(settings) do
		for setting, val in pairs(options) do
			vim[option_type][setting] = val
		end
	end
end

---used for `dashboard.lua`
---expand actions object into the proper shape
---order of action is as follows
---
--- `{ "icon", "key", "desc", "action" }`
---@param actions table
---@return table
M.expand_actions = function(actions)
	local response = {}
	local mappings = { "icon", "key", "desc", "action" }
	for i, action in ipairs(actions) do
		table.insert(response, {})
		for k, val in ipairs(action) do
			local map = mappings[k]
			response[i][map] = map == "icon" and val .. " " or val
		end
	end
	return response
end

return M

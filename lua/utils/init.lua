return {
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
				vim.keymap.set(mode, key, info[1], { desc = info[2] or "" })
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
}

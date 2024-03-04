return {
	---expand keymap object into its respective keymapping
	---@param keymappings table
	---@return nil
	expand_keymaps = function(keymappings)
		for mode, keybindings in pairs(keymappings) do
			for key, info in pairs(keybindings) do
				vim.keymap.set(mode, key, info[1], { desc = info[2] or "" })
			end
		end
	end,

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
}

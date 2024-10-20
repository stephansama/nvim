local M = {}

---move buffer in a specific direction
---@param direction 'next' | 'previous'
---@return function
M.move_buffer = function(direction)
	local directions = { previous = vim.cmd.bprevious, next = vim.cmd.bnext }
	return function()
		directions[direction]()
		print(direction:gsub("^%l", string.upper) .. " Buffer")
	end
end

--- Deletes buffer and alerts the user
M.delete_buffer = function()
	vim.cmd.bd()
	print("Deleting buffer...")
end

---remove properties from list
---@param property_list table
---@param original_table table
M.remove_properties = function(property_list, original_table)
	local copy = vim.deepcopy(original_table)
	for _, lsp in pairs(property_list) do
		copy[lsp] = nil
	end
	return copy
end

--- default fields order i.e completion word + item.kind + item.kind icons
M.cmp_format = function(_, item)
	local icons = require("configs.icons").cmp
	local icon = icons[item.kind] or ""
	item.kind = string.format("%s %s", (icon .. " ") or icon, item.kind or "")
	return item
end

--- install telescope extension
---@param extensions table
---@return function
M.configure_telescope = function(extensions)
	return function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		for _, extension in pairs(extensions) do
			telescope.load_extension(extension)
		end
	end
end

--- launch url dependent on system
---@param url string
---@return nil
M.openURL = function(url)
	if url == "" then
		return
	end
	vim.cmd("exec \"!open '" .. url .. "'\"")
end

---@param function_name "toggle" | "open_visual" | "open_file_search" name of function to invoke from spectre
---@return function keymap function used to invoke spectre
M.spectre_function = function(function_name)
	return function()
		local params = function_name ~= "toggle" and { select_word = true } or {}
		require("spectre")[function_name](params)
	end
end

return M

local M = {}

M.lualine_macros = function()
	return require("NeoComposer.ui").status_recording()
end

M.lualine_package_info = function()
	return require("package-info").get_status()
end

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

M.setup_sign_icons = function(icons, hl_callback)
	for type, icon in pairs(icons) do
		local hl = hl_callback(type)
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
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

M.execute_neotree = function(opts)
	return function()
		local reveal_file = vim.fn.expand("%:p")
		if reveal_file == "" then
			reveal_file = vim.fn.getcwd()
		else
			local f = io.open(reveal_file, "r")
			if f then
				f.close(f)
			else
				reveal_file = vim.fn.getcwd()
			end
		end
		require("neo-tree.command").execute(vim.tbl_deep_extend("force", {
			source = "filesystem",
			action = "focus",
			toggle = true,
			position = "right",
			reveal_file = reveal_file,
			reveal_force_cwd = true,
		}, opts or {}))
	end
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

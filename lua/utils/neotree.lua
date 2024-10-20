local M = {}

---Capture extension from filename
---@param filepath string
---@return string
M.capture_after_first_period_in_filename = function(filepath)
	-- Extract the filename from the full path using patterns
	local filename = filepath:match("([^/]+)$")
	-- Apply the previous function to capture content after the first period in the filename
	local after_period = string.match(filename, "%.(.+)")
	return after_period or filename or ""
end

---return the icon associated with a name removing the first character last character and a combination of the both
---@param name string
---@return string
M.get_icon = function(name)
	local icons = require("configs.icons.neo-tree-icons").icons
	name = string.lower(name)
	local last_element = string.len(name) - 1
	local name_without_first_char = string.sub(name, 2)
	local name_without_last_char = string.sub(name, 1, last_element)
	local name_without_ending_chars = string.sub(name, 2, last_element)
	local name_without_ending_two_chars = string.sub(name, 3, string.len(name) - 2)
	return icons[name]
		or icons[name_without_first_char]
		or icons[name_without_last_char]
		or icons[name_without_ending_chars]
		or icons[name_without_ending_two_chars]
end

--- load neotree icons from devicons
--- [Custom Icons](https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#custom-icons)
---@param config unknown
---@param node table
---@return table
M.load_neo_tree_icons = function(config, node)
	local highlights = require("neo-tree.ui.highlights")
	local current_icon = config.default or " "
	local padding = config.padding or " "
	local highlight = config.highlight or highlights.FILE_ICON

	if node.type == "directory" then
		highlight = highlights.DIRECTORY_ICON
		local found_icon = M.get_icon(node.name)
		if node:is_expanded() then
			current_icon = found_icon or config.folder_open or "-"
		else
			current_icon = found_icon or config.folder_closed or "+"
		end
	elseif node.type == "file" then
		local success, web_devicons = pcall(require, "nvim-web-devicons")
		if success then
			local ext = M.capture_after_first_period_in_filename(node.path)
			local devicon_full, hl_full = web_devicons.get_icon(node.name, ext)
			local devicon, hl = web_devicons.get_icon(node.name, node.ext)
			current_icon = devicon_full or devicon or current_icon
			highlight = hl_full or hl or highlight
		end
	end

	return { text = current_icon .. padding, highlight = highlight }
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

return M

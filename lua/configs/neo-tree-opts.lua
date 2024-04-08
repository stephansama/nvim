---@see Neotree https://github.com/nvim-neo-tree/neo-tree.nvim
local capture_after_first_period_in_filename = require("utils").capture_after_first_period_in_filename
local neotreeicons = require("configs.icons.neo-tree-icons")
local icon = neotreeicons.icon
local icons = neotreeicons.icons
local symbols = neotreeicons.symbols

---return the icon associated with a name removing the first character last character and a combination of the both
---@param name string
---@return string
local get_icon = function(name)
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

return {
	event_handlers = {
		{
			event = "file_opened",
			handler = function()
				require("neo-tree.command").execute({ action = "close" })
			end,
		},
	},
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	close_if_last_window = true,
	window = { mappings = { ["<ESC>"] = "" } },
	name = { trailing_slash = false, use_git_status_colors = true, highlight = "NeoTreeFileName" },
	-- columns
	file_size = { enabled = true, required_width = 64 },
	last_modified = { enabled = true, required_width = 88 },
	created = { enabled = true, required_width = 110 },
	type = { enabled = true, required_width = 122 },
	symlink_target = { enabled = false },
	buffers = { follow_current_file = { enabled = true } },
	--- icons
	icon = icon,
	git_status = { symbols = symbols },
	filesystem = {
		follow_current_file = { enabled = true },
		window = { mappings = { ["/"] = "", ["f"] = "fuzzy_finder" } },
		filtered_items = { visible = true, hide_dotfiles = false, hide_gitignored = true },
		components = {
			--- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#custom-icons
			icon = function(config, node)
				local highlights = require("neo-tree.ui.highlights")
				local current_icon = config.default or " "
				local padding = config.padding or " "
				local highlight = config.highlight or highlights.FILE_ICON

				if node.type == "directory" then
					highlight = highlights.DIRECTORY_ICON
					local found_icon = get_icon(node.name)
					if node:is_expanded() then
						current_icon = found_icon or config.folder_open or "-"
					else
						current_icon = found_icon or config.folder_closed or "+"
					end
				elseif node.type == "file" then
					local success, web_devicons = pcall(require, "nvim-web-devicons")
					if success then
						local ext = capture_after_first_period_in_filename(node.path)
						local devicon_full, hl_full = web_devicons.get_icon(node.name, ext)
						local devicon, hl = web_devicons.get_icon(node.name, node.ext)
						current_icon = devicon_full or devicon or current_icon
						highlight = hl_full or hl or highlight
					end
				end

				return { text = current_icon .. padding, highlight = highlight }
			end,
		},
	},
}

local capture_after_first_period_in_filename = require("utils").capture_after_first_period_in_filename
local highlights = require("neo-tree.ui.highlights")
local get_icon = require("configs.neo-tree-icons").get_icon

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
	filesystem = {
		follow_current_file = { enabled = true },
		window = { mappings = { ["/"] = "", ["f"] = "fuzzy_finder" } },
		filtered_items = { visible = true, hide_dotfiles = false, hide_gitignored = true },
		components = {
			-- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#custom-icons
			icon = function(config, node)
				local icon = config.default or " "
				local padding = config.padding or " "
				local highlight = config.highlight or highlights.FILE_ICON

				if node.type == "directory" then
					highlight = highlights.DIRECTORY_ICON
					local found_icon = get_icon(node.name)
					if node:is_expanded() then
						icon = found_icon or config.folder_open or "-"
					else
						icon = found_icon or config.folder_closed or "+"
					end
				elseif node.type == "file" then
					local success, web_devicons = pcall(require, "nvim-web-devicons")
					if success then
						local ext = capture_after_first_period_in_filename(node.path)
						local devicon_full, hl_full = web_devicons.get_icon(node.name, ext)
						local devicon, hl = web_devicons.get_icon(node.name, node.ext)
						icon = devicon_full or devicon or icon
						highlight = hl_full or hl or highlight
					end
				end

				return { text = icon .. padding, highlight = highlight }
			end,
		},
	},
	icon = {
		folder_closed = "",
		folder_open = "",
		folder_empty = "󰜌",
		-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
		-- then these will never be used.
		default = "*",
		highlight = "NeoTreeFileIcon",
	},
	git_status = {
		symbols = {
			-- Change type
			added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
			modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
			deleted = "✖", -- this can only be used in the git_status source
			renamed = "󰁕", -- this can only be used in the git_status source
			-- Status type
			untracked = "",
			ignored = "",
			unstaged = "󰄱",
			staged = "",
			conflict = "",
		},
	},
}

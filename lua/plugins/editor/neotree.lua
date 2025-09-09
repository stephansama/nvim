local opts = function()
	---@see Neotree https://github.com/nvim-neo-tree/neo-tree.nvim
	local neotreeicons = require("icons.neotree")
	---@type neotree.Config
	return {
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		close_if_last_window = true,
		icon = neotreeicons.icon,
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		type = {
			enabled = true,
			required_width = 122,
		},
		window = {
			mappings = {
				P = {
					"toggle_preview",
					config = {
						use_float = false,
						use_image_nvim = true,
					},
				},
				["<ESC>"] = "",
			},
		},
		buffers = {
			follow_current_file = { enabled = true },
		},
		created = {
			enabled = true,
			required_width = 110,
		},
		file_size = {
			enabled = true,
			required_width = 64,
		},
		git_status = { symbols = neotreeicons.symbols },
		last_modified = {
			enabled = true,
			required_width = 88,
		},
		symlink_target = { enabled = false },
		filesystem = {
			window = {
				mappings = {
					["/"] = "",
					f = "fuzzy_finder",
				},
			},
			follow_current_file = { enabled = true },
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			components = {
				icon = require("utils.neotree").load_neo_tree_icons,
			},
		},
		event_handlers = { {
			event = "file_opened",
			handler = function()
				require("neo-tree.command").execute({ action = "close" })
			end,
		} },
	}
end

return { {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	branch = "v3.x",
	config = true,
	keys = require("keys.plugin").neo_tree,
	opts = opts,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
} }

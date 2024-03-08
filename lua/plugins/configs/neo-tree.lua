return {
	popup_border_style = "rounded",
	close_if_last_window = true,
	enable_git_status = true,
	enable_diagnostics = true,
	window = {
		mappings = { ["<ESC>"] = "" },
	},
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = false,
			hide_gitignored = true,
		},
		window = {
			mappings = {
				["/"] = "",
				["f"] = "fuzzy_finder",
			},
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
	name = {
		trailing_slash = false,
		use_git_status_colors = true,
		highlight = "NeoTreeFileName",
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
	-- If you don't want to use these columns, you can set `enabled = false` for each of them individually
	file_size = {
		enabled = true,
		required_width = 64, -- min width of window required to show this column
	},
	type = {
		enabled = true,
		required_width = 122, -- min width of window required to show this column
	},
	last_modified = {
		enabled = true,
		required_width = 88, -- min width of window required to show this column
	},
	created = {
		enabled = true,
		required_width = 110, -- min width of window required to show this column
	},
	symlink_target = {
		enabled = false,
	},
}

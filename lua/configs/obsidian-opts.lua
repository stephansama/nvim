return {
	completion = { nvim_cmp = true }, -- Set to false to disable completion.
	open_app_foreground = true,
	templates = {
		subdir = "Templates",
		substitutions = {
			clipboard = function()
				return vim.fn.getreg('"')
			end,
		},
	},
	workspaces = {
		{
			name = "Documents",
			path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/",
			overrides = {},
		},
		{
			name = "no-vault",
			path = function()
				return assert(vim.fn.getcwd())
			end,
			overrides = {
				notes_subdir = vim.NIL,
				disable_frontmatter = true,
				templates = { subdir = vim.NIL },
				new_notes_location = "current_dir",
			},
		},
	},
	mappings = {
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		-- Toggle check-boxes.
		["<leader>ch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
	},
}

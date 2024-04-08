---@see Obsidian https://github.com/epwalsh/obsidian.nvim
return {
	completion = { nvim_cmp = true }, --- Set to false to disable completion.
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
		["<leader>og"] = { action = ":ObsidianTags<CR>" },
		["<leader>ot"] = { action = ":ObsidianTemplate<CR>" },
		["<leader>oo"] = { action = ":ObsidianOpen<CR>" },
		["<leader>ch"] = { ---> Toggle check-boxes.
			opts = { buffer = true },
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
		},
		["gf"] = { ---> Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			opts = { noremap = false, expr = true, buffer = true },
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
		},
	},
}

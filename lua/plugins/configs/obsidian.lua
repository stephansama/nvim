require("obsidian").setup({
	templates = { subdir = "Templates" },
	completion = { nvim_cmp = true }, -- Set to false to disable completion.
	open_app_foreground = true,
	workspaces = {
		{
			name = "Documents",
			path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/",
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
})

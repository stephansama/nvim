return {
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "gv", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
			{ "gb", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
		},
		opts = {
			file_panel = {
				listing_style = "tree",
				tree_options = { flatten_dirs = false, folder_statuses = "only_folded" },
				win_config = { position = "right", width = 35 },
			},
		},
	},
}

return {
	{
		"sindrets/diffview.nvim",
		ft = "*,!dashboard",
		lazy = true,
		opts = {
			file_panel = {
				listing_style = "tree",
				tree_options = { flatten_dirs = false, folder_statuses = "only_folded" },
				win_config = { position = "right", width = 35 },
			},
		},
		init = function()
			vim.keymap.set("n", "gv", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
			vim.keymap.set("n", "gb", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
		end,
	},
}

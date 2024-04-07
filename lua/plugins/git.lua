return {
	{
		"lewis6991/gitsigns.nvim",
		init = function()
			require("gitsigns").setup(require("configs.gitsigns-opts"))
		end,
	},
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gv", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
			{ "<leader>gb", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
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

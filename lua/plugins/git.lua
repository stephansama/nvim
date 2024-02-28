return {
	{
		"lewis6991/gitsigns.nvim",
		init = function()
			require("gitsigns").setup(require("plugins.configs.gitsigns"))
		end,
	},
	{
		"sindrets/diffview.nvim",
		lazy = false,
		init = function()
			vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>")
			vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>")
		end,
		config = function()
			require("diffview").setup({
				view = {
					default = {
						layout = "diff2_vertical",
					},
				},
				file_panel = {
					listing_style = "tree",
					tree_options = { flatten_dirs = false, folder_statuses = "only_folded" },
					win_config = { position = "right", width = 35 },
				},
			})
		end,
	},
	-- TODO: install tpope/vim-fugitive
}

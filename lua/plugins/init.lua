return {
	{ "nvim-lua/plenary.nvim", lazy = false },
	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return require("configs.devicons")
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<C-h>", "<CMD><C-U>TmuxNavigateLeft<CR>" },
			{ "<C-j>", "<CMD><C-U>TmuxNavigateDown<CR>" },
			{ "<C-k>", "<CMD><C-U>TmuxNavigateUp<CR>" },
			{ "<C-l>", "<CMD><C-U>TmuxNavigateRight<CR>" },
		},
	},
	{
		"axieax/urlview.nvim",
		config = true,
		keys = { { "<leader>gx", "<cmd>UrlView<cr>", desc = "Open urlview" } },
	},
}

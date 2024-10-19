return {
	{ "nvim-lua/plenary.nvim", lazy = false },
	{ "TabbyML/vim-tabby", lazy = false },
	{
		"lewis6991/gitsigns.nvim",
		init = function()
			require("gitsigns").setup(require("configs.gitsigns-opts"))
		end,
	},
	{
		"axieax/urlview.nvim",
		config = true,
		keys = { { "<leader>gx", "<cmd>UrlView<cr>", desc = "Open urlview" } },
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
		keys = require("keys.init").tmux,
		init = function()
			vim.g.tmux_navigator_no_mappings = 1
		end,
	},
	{
		"kawre/leetcode.nvim",
		config = true,
		build = ":TSUpdate html",
		keys = require("keys.init").leetcode,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",
			-- optional
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}

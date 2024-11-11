local keys = require("keys.init")

return {
	{ "nvim-lua/plenary.nvim", lazy = false },
	{ "TabbyML/vim-tabby", event = "InsertEnter" },
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = true,
		opts = function()
			return require("configs.gitsigns-opts")
		end,
	},
	{
		"wassimk/gh-navigator.nvim",
		version = "*",
		config = true,
		keys = require("keys.init").gh_navigator,
	},
	{ "axieax/urlview.nvim", config = true, keys = keys.urlview },
	{
		"christoomey/vim-tmux-navigator",
		cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
		keys = keys.tmux,
		init = function()
			vim.g.tmux_navigator_no_mappings = 1
		end,
	},
	{
		"kawre/leetcode.nvim",
		config = true,
		build = ":TSUpdate html",
		keys = require("keys.init").leetcode,
		cmd = "Leet",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}

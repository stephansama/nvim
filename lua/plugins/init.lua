local keys = require("keys.init")

return {
	{ "nvim-lua/plenary.nvim", lazy = false },
	{ "axieax/urlview.nvim", config = true, keys = keys.urlview },
	{
		"jmbuhr/otter.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
		config = true,
		keys = keys.otter,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
		keys = keys.tmux,
		init = function()
			vim.g.tmux_navigator_no_mappings = 1
		end,
	},
	{
		"stephansama/stow.nvim",
		cmd = "Stow",
		keys = require("keys.init").stow,
		config = true,
	},
	{
		"kawre/leetcode.nvim",
		config = true,
		build = ":TSUpdate html",
		keys = require("keys.init").leetcode,
		cmd = "Leet",
		dependencies = {
			"ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}

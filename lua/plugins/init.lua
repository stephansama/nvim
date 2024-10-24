local keys = require("keys.init")

return {
	{ "nvim-lua/plenary.nvim", lazy = false },
	{ "TabbyML/vim-tabby", event = "InsertEnter" },
	{
		"lewis6991/gitsigns.nvim",
		init = function()
			require("gitsigns").setup(require("configs.gitsigns-opts"))
		end,
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

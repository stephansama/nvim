local keys = require("keys.plugin")

return { {
	"nvim-lua/plenary.nvim",
	lazy = false,
}, {
	"axieax/urlview.nvim",
	config = true,
	keys = keys.urlview,
}, {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
	},
	init = function()
		vim.g.tmux_navigator_no_mappings = 1
	end,
}, {
	"kawre/leetcode.nvim",
	config = true,
	build = ":TSUpdate html",
	keys = keys.leetcode,
	cmd = "Leet",
	dependencies = {
		"ibhagwan/fzf-lua",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
} }

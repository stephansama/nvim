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
	keys = keys.tmux,
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
	"stephansama/stow.nvim",
	cmd = "Stow",
	keys = keys.stow,
	config = true,
}, {
	"stephansama/fzf-tmux-runner.nvim",
	cmd = { "FzfTmuxPackageJson", "FzfTmuxMake" },
	keys = keys.fzf_tmux_runner,
	config = true,
	---@module "fzf-tmux-runner"
	---@type FzfTmuxRunnerOpts
	opts = {
		package_manager = "nr",
		direction = "vertical",
	},
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

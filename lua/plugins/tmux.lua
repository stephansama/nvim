local keys = {
	{ "<C-h>", "<CMD>TmuxNavigateLeft<CR>" },
	{ "<C-j>", "<CMD>TmuxNavigateDown<CR>" },
	{ "<C-k>", "<CMD>TmuxNavigateUp<CR>" },
	{ "<C-l>", "<CMD>TmuxNavigateRight<CR>" },
}

return {
	"christoomey/vim-tmux-navigator",
	cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
	keys = keys,
	init = function()
		vim.g.tmux_navigator_no_mappings = 1
	end,
}

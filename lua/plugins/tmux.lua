return {
	"christoomey/vim-tmux-navigator",
	cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
	init = function()
		-- disable default <C-\\> keybinding
		vim.g.tmux_navigator_no_mappings = 1
		vim.keymap.set("n", "<C-h>", "<CMD>TmuxNavigateLeft<CR>")
		vim.keymap.set("n", "<C-j>", "<CMD>TmuxNavigateDown<CR>")
		vim.keymap.set("n", "<C-k>", "<CMD>TmuxNavigateUp<CR>")
		vim.keymap.set("n", "<C-l>", "<CMD>TmuxNavigateRight<CR>")
	end,
	keys = {
		{ "<C-h>", "<CMD>TmuxNavigateLeft<CR>" },
		{ "<C-j>", "<CMD>TmuxNavigateDown<CR>" },
		{ "<C-k>", "<CMD>TmuxNavigateUp<CR>" },
		{ "<C-l>", "<CMD>TmuxNavigateRight<CR>" },
	},
}

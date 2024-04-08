return {
	"kawre/leetcode.nvim",
	keys = {
		{ "<leader>le", "<cmd>Leet<cr>", desc = "Open leet" },
		{ "<leader>lr", "<cmd>Leet run<cr>", desc = "Run leet" },
		{ "<leader>lp", "<cmd>Leet open<cr>", desc = "Open leet url" },
		{ "<leader>lc", "<cmd>Leet lang<cr>", desc = "Open leet language picker" },
		{ "<leader>li", "<cmd>Leet info<cr>", desc = "Get info for leet question" },
	},
	build = ":TSUpdate html",
	config = true,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",
		-- optional
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}

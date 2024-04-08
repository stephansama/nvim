return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	keys = { { "<leader>le", "<cmd>Leet<cr>", desc = "Open leet" } },
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
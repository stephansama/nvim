local openURL = require("utils").openURL

return {
	"kawre/leetcode.nvim",
	config = true,
	build = ":TSUpdate html",
	keys = {
		{ "<leader>le", "<cmd>Leet<cr>", desc = "Open leet" },
		{ "<leader>lr", "<cmd>Leet run<cr>", desc = "Run leet" },
		{ "<leader>lp", "<cmd>Leet open<cr>", desc = "Open leet url" },
		{ "<leader>lc", "<cmd>Leet lang<cr>", desc = "Open leet language picker" },
		{ "<leader>li", "<cmd>Leet info<cr>", desc = "Get info for leet question" },
		{
			"<leader>lh",
			function()
				openURL("https://github.com/kawre/leetcode.nvim?tab=readme-ov-file")
			end,
			desc = "Get info for leet question",
		},
		--
	},
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",
		-- optional
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}

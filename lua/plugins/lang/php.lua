return {
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
			"kevinhwang91/promise-async",
		},
		cmd = { "Laravel" },
		config = true,
		filetypes = { "blade", "php" },
		keys = require("keys.init").laravel,
		opts = {
			pickers = {
				enable = true,
				provider = "fzf-lua",
			},
		},
	},
}

return {
	{ "TabbyML/vim-tabby", lazy = false },
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = true,
		opts = { api_key_cmd = "cat ~/.openai.key" },
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}

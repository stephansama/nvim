return {
	{ "TabbyML/vim-tabby", lazy = false },
	{
		"jackMort/ChatGPT.nvim",
		config = true,
		keys = {
			{ "<leader>ai", "<cmd>ChatGPT<cr>", desc = "Open ChatGPT prompt" },
			{
				"<leader>ai",
				"<cmd>ChatGPTRun explain_code<cr>",
				desc = "Explain code using Chatgpt",
				mode = { "x" },
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}

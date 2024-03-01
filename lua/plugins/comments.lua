return {
	{
		"folke/todo-comments.nvim",
		ft = "*,!nvdash,!dashboard",
		lazy = false,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		init = function()
			vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope initial_mode=normal<CR>")
		end,
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},
}

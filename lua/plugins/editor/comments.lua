return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = true,
		event = "VimEnter",
		keys = { { "<leader>tt", "<CMD>TodoTelescope initial_mode=normal<CR>", desc = "Todo Telescope" } },
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = { enable_autocmd = false },
		lazy = false,
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		ft = { "*", "!dashboard" },
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = true,
		opts = function()
			return {
				--- LHS of operator-pending mappings in NORMAL and VISUAL mode
				opleader = { line = "gc", block = "gC" },
				toggler = { line = "gcc", block = "gCc" },
				extra = { above = "gcO", below = "gco" },
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
	},
	{
		"danymat/neogen",
		config = true,
		event = "BufEnter",
		opts = { enabled = true, snippet_engine = "luasnip" },
		keys = {
			{
				"<leader>cg",
				function()
					require("neogen").generate()
				end,
				desc = "Generate documentation comments",
			},
		},
	},
}

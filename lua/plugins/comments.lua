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
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = { enable_autocmd = false },
		lazy = false,
		config = function(_, opts)
			require("ts_context_commentstring").setup(opts)
		end,
	},
	{
		"numToStr/Comment.nvim",
		ft = { "*", "!dashboard" },
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		opts = function()
			return {
				---LHS of operator-pending mappings in NORMAL and VISUAL mode
				opleader = { line = "gc", block = "gC" },
				toggler = { line = "gcc", block = "gCc" },
				extra = { above = "gcO", below = "gco" },
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},
}

local ft = require("constants.ft").COMMENT_FILETYPES
local keys = require("keys.init")

return {
	{
		"folke/todo-comments.nvim",
		ft = ft,
		keys = keys.todo_comments,
		config = true,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"numToStr/Comment.nvim",
		ft = ft,
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
		ft = ft,
		config = true,
		keys = keys.neogen,
		opts = { enabled = true, snippet_engine = "luasnip" },
	},
}

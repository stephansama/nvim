local ft = require("config.constants").COMMENT_FILETYPES
local keys = require("keys.plugin")

local opts = function()
	return {
		--- LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			line = "gc",
			block = "gC",
		},
		toggler = {
			line = "gcc",
			block = "gCc",
		},
		extra = {
			above = "gcO",
			below = "gco",
		},
		pre_hook = require(
			"ts_context_commentstring.integrations.comment_nvim"
		).create_pre_hook(),
	}
end

return { {
	"folke/todo-comments.nvim",
	keys = keys.todo_comments,
	event = "VeryLazy",
	config = true,
	dependencies = { "nvim-lua/plenary.nvim" },
}, {
	"numToStr/Comment.nvim",
	ft = ft,
	opts = opts,
	config = true,
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
}, {
	"danymat/neogen",
	ft = ft,
	config = true,
	keys = keys.neogen,
	opts = {
		enabled = true,
		snippet_engine = "luasnip",
	},
} }

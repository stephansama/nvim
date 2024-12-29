local utils = require("utils.ui")

return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return require("configs.icons.devicons")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = true,
		opts = function()
			return require("configs.gitsigns-opts")
		end,
	},
	{ "szw/vim-maximizer", keys = require("keys.init").maximizer },
	{ "chentoast/marks.nvim", event = "VeryLazy", opts = { sign_priority = 90 } },
	{ "stevearc/dressing.nvim", init = utils.override_builtins({ "select", "input" }) },
}

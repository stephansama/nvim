local utils = require("utils.ui")

return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return require("configs.icons.devicons")
		end,
	},
	{ "szw/vim-maximizer", keys = require("keys.init").maximizer },
	{ "chentoast/marks.nvim", event = "VeryLazy", opts = { sign_priority = 90 } },
	{ "stevearc/dressing.nvim", init = utils.override_builtins({ "select", "input" }) },
}

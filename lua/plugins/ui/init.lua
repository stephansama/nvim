local utils = require("utils.ui")

return {
	{ "nvim-tree/nvim-web-devicons", opts = require("icons.devicons") },
	{ "szw/vim-maximizer", keys = require("keys.init").maximizer },
	{ "chentoast/marks.nvim", event = "VeryLazy", opts = { sign_priority = 90 } },
	{ "stevearc/dressing.nvim", init = utils.override_builtins({ "select", "input" }) },
}

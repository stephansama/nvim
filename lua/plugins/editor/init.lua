local keys = require("keys.plugin")

return { { "artemave/workspace-diagnostics.nvim" }, {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	config = true,
}, {
	"tomiis4/Hypersonic.nvim",
	cmd = "Hypersonic",
	event = "CmdlineEnter",
	config = true,
}, {
	"folke/trouble.nvim",
	opts = {},
	keys = keys.trouble,
}, {
	"kevinhwang91/nvim-bqf",
	ft = "qf",
}, {
	"mcauley-penney/visual-whitespace.nvim",
	config = true,
	event = "ModeChanged *:[vV\22]",
	opts = {},
}, {
	"stevearc/quicker.nvim",
	event = "FileType qf",
	---@module "quicker"
	---@type quicker.SetupOptions
	opts = {},
	keys = keys.quicker,
}, {
	"wassimk/gh-navigator.nvim",
	version = "*",
	config = true,
	keys = keys.gh_navigator,
}, {
	"mbbill/undotree",
	keys = keys.undotree,
	config = function()
		vim.g.undotree_WindowLayout = 3
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
} }

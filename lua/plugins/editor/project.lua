return { {
	"DrKJeff16/project.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = {
		"ProjectAdd",
		"ProjectConfig",
		"ProjectDelete",
		"ProjectFzf",
		"ProjectRecents",
		"ProjectRoot",
	},
	cond = vim.fn.has("nvim-0.11") == 1,
	keys = require("keys.plugin").project,
	---@module 'project'
	---@type Project.Config.Options
	opts = {},
} }

return {
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
	cond = vim.version().minor >= 11,
	keys = require("keys.plugin").project,
	---@module 'project'
	---@type Project.Config.Options
	opts = {},
}

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"mrcjkb/rustaceanvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
		"thenbe/neotest-playwright",
	},
	config = true,
	keys = require("keys.init").neotest,
	opts = function()
		return require("configs.neotest-opts")
	end,
}

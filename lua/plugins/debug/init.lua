local keys = require("keys.init")

return {
	{ "dundalek/bloat.nvim", cmd = "Bloat" },
	{ "dstein64/vim-startuptime", keys = keys.startuptime },
	{
		"meznaric/key-analyzer.nvim",
		config = true,
		keys = keys.key_analyzer,
		opts = {},
		cmd = "KeyAnalyzer",
	},
}

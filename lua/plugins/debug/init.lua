local keys = require("keys.init")

return {
	{ "dstein64/vim-startuptime", keys = keys.startuptime },
	{ "meznaric/key-analyzer.nvim", keys = keys.key_analyzer, config = true, cmd = "KeyAnalyzer" },
}

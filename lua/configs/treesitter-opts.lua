local keymaps = {
	init_selection = "<leader>ss",
	node_incremental = "<leader>si",
	node_decremental = "<leader>sd",
	scope_incremental = "<leader>sc",
}

return {
	highlight = { enable = true },
	auto_install = false,
	sync_install = false,
	ensure_installed = require("constants.installed").TREESITTER_ENSURE_INSTALLED,
	parser_install_dir = require("constants.dir").TREESITTER_PARSER_INSTALL_DIR,
	incremental_selection = { enable = true, keymaps = keymaps },
}

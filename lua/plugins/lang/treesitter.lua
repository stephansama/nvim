local keys = require("keys.plugin")
local lang = require("lang.pulled")
local TREESITTER_PARSER_INSTALL_DIR =
	require("constants.init").TREESITTER_PARSER_INSTALL_DIR

return { {
	"hedyhli/outline.nvim",
	config = true,
	keys = keys.outline,
}, {
	"nvim-treesitter/nvim-treesitter-context",
	opts = { enable = false },
	keys = keys.treesitter_context,
}, {
	"nvim-treesitter/nvim-treesitter",
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function(_, opts)
		vim.opt.runtimepath:append(TREESITTER_PARSER_INSTALL_DIR)
		require("nvim-treesitter.configs").setup(opts)
		local parsers = lang.TREESITTER_PARSERS
		local configs = require("nvim-treesitter.parsers").get_parser_configs()
		configs = vim.tbl_deep_extend("force", configs, parsers)
	end,
	opts = {
		highlight = { enable = true },
		auto_install = false,
		sync_install = false,
		ensure_installed = lang.TREESITTER,
		parser_install_dir = TREESITTER_PARSER_INSTALL_DIR,
		incremental_selection = {
			keymaps = keys.treesitter_incremental_selection,
			enable = true,
		},
	},
} }

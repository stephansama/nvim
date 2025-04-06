return {
	{
		"hedyhli/outline.nvim",
		config = true,
		keys = require("keys.init").outline,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		opts = { enable = false },
		keys = require("keys.init").treesitter_context,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function(_, opts)
			local dir = require("constants.dir").TREESITTER_PARSER_INSTALL_DIR
			vim.opt.runtimepath:append(dir)
			require("nvim-treesitter.configs").setup(opts)
			local parsers = require("constants.pulled").TREESITTER_PARSERS
			local configs = require("nvim-treesitter.parsers").get_parser_configs()
			configs = vim.tbl_deep_extend("force", configs, parsers)
		end,
		opts = {
			highlight = { enable = true },
			auto_install = false,
			sync_install = false,
			ensure_installed = require("constants.pulled").TREESITTER_ENSURE_INSTALLED,
			parser_install_dir = require("constants.dir").TREESITTER_PARSER_INSTALL_DIR,
			incremental_selection = {
				keymaps = require("keys.init").treesitter_incremental_selection,
				enable = true,
			},
		},
	},
}

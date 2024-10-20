return {
	{
		"hedyhli/outline.nvim",
		config = true,
		keys = require("keys.init").outline,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "windwp/nvim-ts-autotag", ft = require("constants.ft").WEB_FILETYPES, config = true },
		},
		config = function(_, opts)
			local dir = require("constants.dir").TREESITTER_PARSER_INSTALL_DIR
			vim.opt.runtimepath:append(dir)
			require("nvim-treesitter.configs").setup(opts)
		end,
		opts = {
			highlight = { enable = true },
			auto_install = false,
			sync_install = false,
			ensure_installed = require("constants.installed").TREESITTER_ENSURE_INSTALLED,
			parser_install_dir = require("constants.dir").TREESITTER_PARSER_INSTALL_DIR,
			incremental_selection = {
				enable = true,
				keymaps = require("keys.init").treesitter_incremental_selection,
			},
		},
	},
}

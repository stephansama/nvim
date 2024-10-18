return {
	{
		"hedyhli/outline.nvim",
		config = true,
		keys = { { "|", "<CMD>Outline<CR>", desc = "Toggle Outline" } },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				ft = require("constants.ft").WEB_FILETYPES,
				config = true,
			},
		},
		opts = function()
			return require("configs.treesitter-opts")
		end,
		config = function(_, opts)
			local dir = require("constants.dir").TREESITTER_PARSER_INSTALL_DIR
			vim.opt.runtimepath:append(dir)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}

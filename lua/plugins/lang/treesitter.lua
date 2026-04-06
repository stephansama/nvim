local keys = require("keys.plugin")
local lang = require("plugins.lang")
local TREESITTER_PARSER_INSTALL_DIR =
	require("config.constants").TREESITTER_PARSER_INSTALL_DIR

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
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.setup()
		treesitter.install(lang.TREESITTER)

		vim.api.nvim_create_autocmd("FileType", { callback = function(args)
			pcall(vim.treesitter.start, args.buf)
		end })
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

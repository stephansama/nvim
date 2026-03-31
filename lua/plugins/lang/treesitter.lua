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

		vim.defer_fn(function()
			treesitter.install(lang.TREESITTER):wait(300000)
		end, 0)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = lang.TREESITTER,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
	opts = {
		highlight = { enable = true },
		auto_install = true,
		sync_install = true,
		ensure_installed = lang.TREESITTER,
		install_dir = TREESITTER_PARSER_INSTALL_DIR,
		incremental_selection = {
			keymaps = keys.treesitter_incremental_selection,
			enable = true,
		},
	},
} }

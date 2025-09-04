local keys = require("keys.plugin")
local lint = require("utils.lint")

return {
	{ "artemave/workspace-diagnostics.nvim" },
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = true,
	},
	{
		"folke/trouble.nvim",
		opts = {},
		keys = keys.trouble,
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},
	{
		"mcauley-penney/visual-whitespace.nvim",
		config = true,
		event = "ModeChanged *:[vV\22]",
		opts = {},
	},
	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {},
		keys = keys.quicker,
	},
	{
		"mfussenegger/nvim-lint",
		init = lint.create_lint_init,
		config = function()
			require("lint").linters_by_ft = require("lang.pulled").LINTERS
		end,
	},
	{
		"stevearc/conform.nvim",
		config = true,
		event = "BufWritePre",
		opts = {
			formatters_by_ft = require("lang.pulled").FORMATTERS,
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
			formatters = {
				prettier = { require_cwd = true },
			},
		},
	},
	{
		"wassimk/gh-navigator.nvim",
		version = "*",
		config = true,
		keys = keys.gh_navigator,
	},
	{
		"L3MON4D3/LuaSnip",
		config = require("utils.snippets"),
		build = "make install_jsregexp",
		opts = {
			history = true,
			updateevents = "TextChanged,TextChangedI",
		},
	},
	{
		"mg979/vim-visual-multi",
		lazy = false,
		init = function()
			vim.g.VM_leader = "<BS>"
			vim.keymap.set("n", "<A-j>", "<Plug>(VM-Add-Cursor-Down)") -- ∆ macOS specific
			vim.keymap.set("n", "<A-k>", "<Plug>(VM-Add-Cursor-Up)") -- ˚ macOS equivalent
		end,
	},
	{
		"mbbill/undotree",
		keys = keys.undotree,
		config = function()
			vim.g.undotree_WindowLayout = 3
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
}

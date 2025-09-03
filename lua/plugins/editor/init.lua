local keys = require("keys.plugin")
local lint = require("utils.lint")

return {
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = true,
	},
	{ "artemave/workspace-diagnostics.nvim" },
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
		config = lint.load_linters,
		keys = { {
			"<leader>sp",
			lint.toggle_cspell,
			desc = "lint with cspell",
		} },
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = true,
		opts = {
			formatters = {
				prettier = { require_cwd = true },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
			formatters_by_ft = require("constants.pulled").FORMATTERS,
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
		build = "make install_jsregexp",
		opts = {
			history = true,
			updateevents = "TextChanged,TextChangedI",
		},
		config = require("utils.snippets"),
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
		keys = { {
			"<leader>u",
			"<CMD>UndotreeToggle<CR>",
			desc = "UndotreeToggle",
		} },
		config = function()
			vim.g.undotree_WindowLayout = 3
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
}

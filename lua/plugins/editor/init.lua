return {
	{ "nvim-pack/nvim-spectre", dependencies = { "nvim-lua/plenary.nvim" }, keys = require("keys.init").spectre },
	{ "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = true },
	{ "artemave/workspace-diagnostics.nvim" },
	{ "folke/trouble.nvim", opts = {}, keys = require("keys.init").trouble },
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{
		"stevearc/quicker.nvim",
		event = "FileType qf",
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {},
		keys = require("keys.init").quicker,
	},
	{
		"mfussenegger/nvim-lint",
		init = function()
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
		config = function()
			require("lint").linters_by_ft = require("constants.pulled").LINTERS
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = true,
		opts = {
			format_on_save = { timeout_ms = 1000, lsp_fallback = true },
			formatters_by_ft = require("constants.pulled").FORMATTERS,
		},
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		keys = require("keys.init").harpoon,
		branch = "harpoon2",
		config = function(_, opts)
			require("harpoon"):setup(opts)
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		opts = { history = true, updateevents = "TextChanged,TextChangedI" },
		config = require("configs.snippets"),
	},
	{
		"RRethy/vim-illuminate",
		lazy = false,
		config = function()
			require("illuminate").configure(require("configs.illuminate-opts"))
		end,
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
		keys = { { "<leader>u", "<CMD>UndotreeToggle<CR>", desc = "UndotreeToggle" } },
		config = function()
			vim.g.undotree_WindowLayout = 3
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
}

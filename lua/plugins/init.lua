return {
	{ "nvim-lua/plenary.nvim", lazy = false },
	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return require("configs.devicons")
		end,
	},
	{ "TabbyML/vim-tabby", lazy = false },
	{ "bfontaine/Brewfile.vim", ft = "Brewfile" },
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
	{ "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = true },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { mode = "workspace_diagnostics" },
		lazy = false,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<C-h>", "<CMD><C-U>TmuxNavigateLeft<CR>" },
			{ "<C-j>", "<CMD><C-U>TmuxNavigateDown<CR>" },
			{ "<C-k>", "<CMD><C-U>TmuxNavigateUp<CR>" },
			{ "<C-l>", "<CMD><C-U>TmuxNavigateRight<CR>" },
		},
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<CMD>UndotreeToggle<CR>", desc = "UndotreeToggle" },
		},
		config = function()
			vim.g.undotree_WindowLayout = 3
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
}

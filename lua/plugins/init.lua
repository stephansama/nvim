return {
	{ "nvim-lua/plenary.nvim", lazy = false },
	{ "nvim-tree/nvim-web-devicons" },
	{ "TabbyML/vim-tabby", lazy = false },
	{ "bfontaine/Brewfile.vim", lazy = false },
	{
		"RRethy/vim-illuminate",
		lazy = false,
		config = function()
			require("illuminate").configure(require("plugins.configs.illuminate"))
		end,
	},
	{
		"mg979/vim-visual-multi",
		lazy = false,
		init = function()
			vim.g.VM_leader = "<space>"
			vim.keymap.set("n", "<C-j>", "<Plug>(VM-Add-Cursor-Down)")
			vim.keymap.set("n", "<C-k>", "<Plug>(VM-Add-Cursor-Up)")
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"mbbill/undotree",
		lazy = false,
		config = function()
			vim.g.undotree_WindowLayout = 3
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
}

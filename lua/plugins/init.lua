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
			-- macOS specific keybindings
			vim.keymap.set("n", "∆", "<Plug>(VM-Add-Cursor-Down)")
			vim.keymap.set("n", "˚", "<Plug>(VM-Add-Cursor-Up)")
			-- vim.keymap.set("n", "<A-j>", "<Plug>(VM-Add-Cursor-Down)")
			-- vim.keymap.set("n", "<A-k>", "<Plug>(VM-Add-Cursor-Up)")
		end,
	},
	{ "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = true },
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, lazy = false },
	{
		"mbbill/undotree",
		lazy = false,
		config = function()
			vim.g.undotree_WindowLayout = 3
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")
		end,
	},
}

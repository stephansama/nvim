return {
	{ "kylechui/nvim-surround", version = "*", event = "InsertEnter", config = true },
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
		"folke/trouble.nvim",
		opts = { mode = "workspace_diagnostics" },
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

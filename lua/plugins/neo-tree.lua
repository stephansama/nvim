local window_picker_config = {
	filter_rules = {
		include_current_win = false,
		autoselect_one = true,
		-- filter using buffer options
		bo = {
			-- if the file type is one of following, the window will be ignored
			filetype = { "neo-tree", "neo-tree-popup", "notify" },
			-- if the buffer type is one of following, the window will be ignored
			buftype = { "terminal", "quickfix" },
		},
	},
}

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup(window_picker_config)
			end,
		},
	},
	init = function()
		vim.keymap.set("n", "\\", "<cmd>Neotree reveal toggle position=right<CR>")
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree reveal toggle position=current<CR>")
	end,
	config = function()
		require("neo-tree").setup(require("configs.neo-tree-opts"))
	end,
}

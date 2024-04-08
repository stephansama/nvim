return {
	{ "nvim-lua/plenary.nvim", lazy = false },
	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return require("configs.icons.devicons")
		end,
	},
	{
		"axieax/urlview.nvim",
		config = true,
		keys = { { "<leader>gx", "<cmd>UrlView<cr>", desc = "Open urlview" } },
	},
}

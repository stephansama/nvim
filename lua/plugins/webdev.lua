local web_fts = { "jsx", "tsx", "html", "astro", "svelte", "javascriptreact", "typescriptreact" }

return {
	{ "windwp/nvim-ts-autotag", ft = web_fts, event = "VeryLazy" },
	{ "ellisonleao/dotenv.nvim" },
	{ "mattn/emmet-vim", ft = web_fts },
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		config = function()
			require("tailwindcss-colors").setup()
		end,
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		ft = "rest",
		config = function()
			require("rest-nvim").setup(require("plugins.configs.rest"))
		end,
	},
}

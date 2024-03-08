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
}

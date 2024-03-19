local web_fts = { "jsx", "tsx", "html", "astro", "svelte", "javascriptreact", "typescriptreact" }

return {
	{ "ellisonleao/dotenv.nvim" },
	{ "mattn/emmet-vim", ft = web_fts },
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		config = function()
			require("tailwindcss-colors").setup()
		end,
	},
}

return {
	{ "windwp/nvim-ts-autotag" },
	{ "ellisonleao/dotenv.nvim" },
	{
		"mattn/emmet-vim",
		ft = { "html", "astro", "svelte", "typescriptreact", "tsx", "javascriptreact", "jsx" },
	},
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

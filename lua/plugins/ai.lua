return {
	{ "TabbyML/vim-tabby", event = "InsertEnter" },
	{
		"dustinblackman/oatmeal.nvim",
		cmd = { "Oatmeal" },
		opts = {
			backend = "ollama",
			model = "codellama:latest",
		},
		keys = require("keys.init").oatmeal,
	},
}

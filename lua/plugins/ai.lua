return {
	{ "TabbyML/vim-tabby", event = "InsertEnter" },
	{
		"dustinblackman/oatmeal.nvim",
		cmd = { "Oatmeal" },
		keys = require("keys.init").oatmeal,
		opts = { backend = "ollama", model = "codellama:latest" },
	},
}

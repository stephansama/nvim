return {
	{ "b0o/schemastore.nvim" },
	{
		"kristijanhusak/vim-dadbod-ui",
		keys = require("keys.init").dbui,
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}

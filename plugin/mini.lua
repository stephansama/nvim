vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.diff" },
	{ src = "https://github.com/nvim-mini/mini.notify" },
})

require("mini.diff").setup({
	view = { style = "sign" },
})

local notify = require("mini.notify")

notify.setup({
	lsp_progress = { enable = true },
	window = {
		max_width_share = 0.75,
		winblend = 0,
		config = {
			border = "rounded",
			anchor = "SE",
			col = vim.o.columns,
			row = vim.o.lines - 1,
		},
	},
})

vim.notify = notify.make_notify()

vim.api.nvim_create_user_command("Notifications", notify.show_history, {
	nargs = 0,
})

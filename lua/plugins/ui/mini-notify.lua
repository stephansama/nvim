return {
	"nvim-mini/mini.notify",
	opts = {
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
	},
	config = function(_, options)
		local notify = require("mini.notify")

		notify.setup(options)

		vim.notify = notify.make_notify()

		vim.api.nvim_create_user_command("Notifications", notify.show_history, {
			nargs = 0,
		})
	end,
}

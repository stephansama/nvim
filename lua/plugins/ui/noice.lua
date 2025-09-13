---@type NoiceConfig
local opts = {
	lsp = {
		progress = { enabled = false },
		hover = { silent = true },
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},
	messages = { enabled = true },
	notify = { enabled = false },
	presets = {
		long_message_to_split = true,
		lsp_doc_border = true,
	},
	views = {
		cmdline_popup = {
			position = {
				row = 5,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
	},
}

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = opts,
	keys = require("keys.plugin").noice,
	dependencies = { "MunifTanjim/nui.nvim", {
		"nvim-mini/mini.notify",
		opts = {
			lsp_progress = { enable = true },
			window = {
				max_width_share = 0.50,
				winblend = 0,
			},
		},
		config = function(_, options)
			local notify = require("mini.notify")

			notify.setup(options)

			vim.notify = notify.make_notify()

			vim.api.nvim_create_user_command(
				"Notifications",
				notify.show_history,
				{ nargs = 0 }
			)
		end,
	} },
}

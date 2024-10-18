return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	config = true,
	opts = {
		format_on_save = { timeout_ms = 1000, lsp_fallback = true },
		formatters_by_ft = require("constants.formatters"),
	},
}

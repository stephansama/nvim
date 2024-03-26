local opts = {
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		css = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		astro = { { "prettierd", "prettier" } },
		svelte = { { "prettierd", "prettier" } },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },

		go = { "gofmt" },
		sh = { "shfmt" },
		zshrc = { "shfmt" },
		toml = { "taplo" },
		markdown = { "markdownlint" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = opts,
	config = true,
}

local opts = {
	format_on_save = { timeout_ms = 500, lsp_fallback = true },
	--- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
	formatters_by_ft = {
		go = { "gofmt" },
		sh = { "shfmt" },
		lua = { "stylua" },
		toml = { "taplo" },
		zshrc = { "shfmt" },
		markdown = { "markdownlint" },
		css = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		astro = { { "prettierd", "prettier" } },
		svelte = { { "prettierd", "prettier" } },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
	},
}

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = opts,
	config = true,
}

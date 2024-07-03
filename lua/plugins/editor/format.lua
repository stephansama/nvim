local opts = {
	format_on_save = { timeout_ms = 1000, lsp_fallback = true },
	--- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
	formatters_by_ft = {
		go = { "gofmt" },
		sh = { "shfmt" },
		zsh = { "shfmt" },
		lua = { "stylua" },
		toml = { "taplo" },
		yaml = { "yamlfmt" },
		zshrc = { "shfmt" },
		markdown = { "markdownlint" },
		css = { "prettier" },
		html = { "prettier" },
		astro = { "prettier" },
		svelte = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
	},
}

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = opts,
	config = true,
}

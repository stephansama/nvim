local rustaceanvim_opts = {
	server = {
		on_attach = function(client, bufnr)
			require("lsp-inlayhints").on_attach(client, bufnr)
		end,
	},
}

return {
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		event = "BufReadPost",
		ft = { "rust" },
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			vim.g.rustaceanvim = rustaceanvim_opts
		end,
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	},
}

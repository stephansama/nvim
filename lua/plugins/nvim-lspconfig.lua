return {
	{
		"neovim/nvim-lspconfig",
		opts = { inlay_hints = { enabled = true } },
		event = "User FilePost",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},
	-- WARN: remove as this has been deprecated
	{
		"lvimuser/lsp-inlayhints.nvim",
		init = function()
			vim.keymap.set("n", "<leader>ti", function()
				require("lsp-inlayhints").toggle()
			end, { desc = "Toggle inlay hints" })
			-- vim.cmd([[hi LspInlayHint guifg=#A9A9A9 guibg=none]])
		end,
		config = function()
			require("lsp-inlayhints").setup()
		end,
	},
}

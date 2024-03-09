return {
	{
		"j-hui/fidget.nvim",
		ft = "*,!dashboard",
		event = "BufEnter",
		lazy = false,
		opts = { notification = { window = { border = "single", winblend = 0 } } },
	},
	{
		"neovim/nvim-lspconfig",
		opts = { inlay_hints = { enabled = true } },
		event = "User FilePost",
		config = function()
			require("configs.lspconfig-conf")
		end,
	},
	-- WARN: remove when 0.10 comes out as this has been deprecated
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

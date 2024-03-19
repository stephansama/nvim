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
		dependencies = {
			"kevinhwang91/nvim-ufo",
			dependencies = {
				"kevinhwang91/promise-async",
				{
					"luukvbaal/statuscol.nvim",
					lazy = false,
					config = function()
						local builtin = require("statuscol.builtin")
						require("statuscol").setup({
							relculright = true,
							segments = {
								{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
								{ text = { "%s" }, click = "v:lua.ScSa" },
								{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
							},
						})
					end,
				},
			},
			lazy = false,
		},
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

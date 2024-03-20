local statuscol_opts = function()
	local builtin = require("statuscol.builtin")
	return {
		relculright = true,
		segments = {
			{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
			{ text = { "%s" }, click = "v:lua.ScSa" },
			{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
		},
	}
end

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
			{ -- install ufo for better code folding support
				"kevinhwang91/nvim-ufo",
				lazy = false,
				dependencies = {
					"kevinhwang91/promise-async",
					{ "luukvbaal/statuscol.nvim", lazy = false, opts = statuscol_opts, config = true },
				},
			},
		},
	},
	-- WARN: remove when 0.10 comes out as this has been deprecated
	{
		"lvimuser/lsp-inlayhints.nvim",
		init = function()
			vim.keymap.set("n", "<leader>ti", function()
				require("lsp-inlayhints").toggle()
			end, { desc = "Toggle inlay hints" })
		end,
		config = true,
	},
}

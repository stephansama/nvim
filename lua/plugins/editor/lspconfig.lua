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
		"neovim/nvim-lspconfig",
		opts = { inlay_hints = { enabled = true } },
		event = "User FilePost",
		config = function()
			require("configs.lspconfig")
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
	{
		"MysticalDevil/inlay-hints.nvim",
		event = "LspAttach",
		config = true,
		dependencies = { "neovim/nvim-lspconfig" },
	},
}

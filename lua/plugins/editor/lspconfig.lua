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
		event = "BufEnter",
		config = function()
			require("srandle.lsp")
			require("nvim-highlight-colors").turnOn()
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
			{
				"brenoprata10/nvim-highlight-colors",
				config = true,
				opts = {
					render = "background",
					enable_hex = true,
					enable_hsl = true,
					enable_rgb = true,
					enable_tailwind = true,
					enable_var_usage = true,
					enable_short_hex = true,
					enable_named_colors = true,
					virtual_symbol = "■",
					virtual_symbol_prefix = "",
					virtual_symbol_suffix = " ",
					virtual_symbol_position = "inline",
				},
			},
		},
	},
	{
		"MysticalDevil/inlay-hints.nvim",
		keys = require("keys.init").inlay_hints,
		event = "LspAttach",
		config = true,
		dependencies = { "neovim/nvim-lspconfig" },
	},
}

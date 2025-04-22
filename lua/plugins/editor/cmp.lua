return {
	{
		"saghen/blink.cmp",
		dependencies = {},
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "enter",
				["<CR>"] = {
					function(cmp)
						local cmp_autopairs = require("nvim-autopairs.completion.cmp")
						return cmp.accept({ callback = cmp_autopairs.on_confirm_done })
					end,
				},
			},
			appearance = { nerd_font_variant = "mono" },
			cmdline = { completion = { menu = { auto_show = true } } },
			completion = {
				accept = { auto_brackets = { enabled = true } },
				menu = { border = "rounded" },
			},
			signature = { window = { border = "rounded" } },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"windwp/nvim-autopairs",
		opts = { fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } },
		config = true,
	},
}

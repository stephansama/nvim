return {
	{
		"saghen/blink.cmp",
		dependencies = {},
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "enter" },
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
}

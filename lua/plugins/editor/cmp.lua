return {
	{
		-- https://cmp.saghen.dev/
		"saghen/blink.cmp",
		dependencies = {
			{
				"windwp/nvim-autopairs",
				config = true,
				opts = { fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } },
			},
		},
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "enter" },
			appearance = { nerd_font_variant = "mono" },
			cmdline = { completion = { menu = { auto_show = true } } },
			completion = {
				accept = { auto_brackets = { enabled = false } },
				menu = { border = "rounded" },
			},
			signature = { window = { border = "rounded" } },
			snippets = { preset = "luasnip" },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}

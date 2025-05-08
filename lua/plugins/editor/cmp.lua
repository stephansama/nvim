---@module 'blink.cmp'
---@type blink.cmp.Config
local opts = {
	keymap = { preset = "enter", ["<C-e>"] = { "hide", "show" } },
	appearance = { nerd_font_variant = "mono" },
	cmdline = { completion = { menu = { auto_show = true } } },
	completion = {
		accept = { auto_brackets = { enabled = false } },
		menu = { border = "rounded" },
	},
	signature = { window = { border = "rounded" } },
	snippets = { preset = "luasnip" },
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	fuzzy = {
		implementation = "prefer_rust_with_warning",
		sorts = { require("utils.init").depriotize_emmet, "score", "sort_text" },
	},
}

return {
	{
		-- https://cmp.saghen.dev/
		"saghen/blink.cmp",
		version = "1.*",
		opts = opts,
		opts_extend = { "sources.default" },
		dependencies = {
			{
				"windwp/nvim-autopairs",
				config = true,
				opts = { fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } },
			},
		},
	},
}

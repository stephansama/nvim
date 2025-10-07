---@module 'blink.cmp'
---@type blink.cmp.Config
local opts = {
	keymap = {
		preset = "enter",
		["<C-e>"] = { "hide", "show" },
	},
	appearance = { nerd_font_variant = "mono" },
	cmdline = {
		completion = {
			menu = { auto_show = true },
		},
	},
	completion = {
		accept = {
			auto_brackets = { enabled = false },
		},
		menu = { border = "rounded" },
	},
	signature = {
		window = { border = "rounded" },
	},
	snippets = { preset = "luasnip" },
	sources = {
		default = {
			"copilot",
			"dictionary",
			"git",
			"lsp",
			"path",
			"snippets",
			"buffer",
		},
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100,
				async = true,
			},
			dictionary = {
				module = "blink-cmp-dictionary",
				name = "dictionary",
				min_keyword_length = 3,
				opts = {
					dictionary_files = nil,
					dictionary_directories = {
						require("config.constants").DICTIONARY_DIR,
					},
				},
			},
			git = {
				module = "blink-cmp-git",
				name = "Git",
				opts = {},
			},
		},
	},
	fuzzy = {
		implementation = "prefer_rust_with_warning",
		---@see BlinkDocumentation https://cmp.saghen.dev/recipes.html#deprioritize-specific-lsp
		sorts = { "exact", function(a, b)
			if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then return end
			return b.client_name == "emmet_ls"
		end, "score", "sort_text" },
	},
}

--- https://cmp.saghen.dev/
return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = opts,
	opts_extend = { "sources.default" },
	dependencies = {
		{ "fang2hou/blink-copilot" },
		{ "Kaiser-Yang/blink-cmp-git" },
		{
			"Kaiser-Yang/blink-cmp-dictionary",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"windwp/nvim-autopairs",
			config = true,
			opts = {
				fast_wrap = {},
				disable_filetype = { "vim" },
			},
		},
	},
}

return {
	"catppuccin/nvim",
	priority = 1000,
	name = "catppuccin",
	lazy = false,
	opts = {
		flavour = "mocha",
		-- background = { -- :h background
		-- 	light = "latte",
		-- 	dark = "mocha",
		-- },
		transparent_background = true,
		show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
		integrations = {
			cmp = true,
			ufo = true,
			mason = true,
			noice = true,
			notify = false,
			harpoon = true,
			neotree = true,
			gitsigns = true,
			dashboard = true,
			telescope = true,
			illuminate = true,
			treesitter = true,
			lsp_trouble = true,
			indent_blankline = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
		},
	},
}

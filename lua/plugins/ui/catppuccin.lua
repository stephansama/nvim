--- https://github.com/catppuccin/nvim?tab=readme-ov-file#configuration
local utils = require("utils.ui")
local theme = require("constants")

---@module 'catppuccin'
---@type CatppuccinOptions
local opts = {
	float = {
		transparent = true,
		solid = false,
	},
	flavour = "mocha",
	show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
	transparent_background = true,
	integrations = {
		dap = true,
		fzf = true,
		ufo = true,
		mason = true,
		noice = true,
		dap_ui = true,
		notify = true,
		harpoon = true,
		neotest = true,
		neotree = true,
		gitsigns = true,
		blink_cmp = true,
		dashboard = true,
		telescope = true,
		illuminate = true,
		treesitter = true,
		lsp_trouble = true,
		nvim_surround = true,
		window_picker = true,
		render_markdown = true,
		symbols_outline = true,
		indent_blankline = true,
		treesitter_context = true,
		native_lsp = {
			enabled = true,
			underlines = utils.create_theme_options("underline"),
			virtual_text = utils.create_theme_options("italic"),
		},
	},
}

return { {
	"catppuccin/nvim",
	priority = 1001,
	name = "catppuccin",
	opts = opts,
}, {
	"f-person/auto-dark-mode.nvim",
	priority = 1002,
	lazy = false,
	opts = {
		update_interval = 1000,
		set_dark_mode = utils.auto_theme(theme.THEME_DARKMODE),
		set_light_mode = utils.auto_theme(theme.THEME_LIGHTMODE),
	},
} }

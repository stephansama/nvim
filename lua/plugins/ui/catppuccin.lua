--- https://github.com/catppuccin/nvim?tab=readme-ov-file#configuration

--- create nvim-lspconfig catppuccin options
---@param type string
---@return table
local function create_theme_options(type)
	return {
		hints = { type },
		errors = { type },
		warnings = { type },
		information = { type },
	}
end

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
			underlines = create_theme_options("underline"),
			virtual_text = create_theme_options("italic"),
		},
	},
}

return { {
	"catppuccin/nvim",
	priority = 1001,
	name = "catppuccin",
	opts = opts,
} }

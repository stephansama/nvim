--- https://github.com/catppuccin/nvim?tab=readme-ov-file#configuration

--- create nvim-lspconfig catppuccin options
---@param type string
---@return table
local create_integration_options = function(type)
	return {
		hints = { type },
		errors = { type },
		warnings = { type },
		information = { type },
	}
end

local integrations = {
	cmp = true,
	ufo = true,
	mason = true,
	noice = true,
	notify = false,
	harpoon = true,
	neotree = true,
	gitsigns = true,
	dashboard = true,
	telescope = false,
	illuminate = true,
	treesitter = true,
	lsp_trouble = true,
	indent_blankline = true,
	native_lsp = {
		enabled = true,
		underlines = create_integration_options("underline"),
		virtual_text = create_integration_options("italic"),
	},
}
local opts = {
	flavour = "mocha",
	show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
	transparent_background = true,
	integrations = integrations,
}

return opts

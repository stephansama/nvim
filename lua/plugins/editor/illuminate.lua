---@see Illuminate https://github.com/RRethy/vim-illuminate
local opts = {
	case_insensitive_regex = false,
	delay = 100,
	filetype_overrides = {},
	filetypes_allowlist = {},
	filetypes_denylist = { "dirbuf", "dirvish", "fugitive" },
	large_file_cutoff = nil,
	large_file_overrides = nil,
	min_count_to_highlight = 1,
	modes_allowlist = {},
	modes_denylist = {},
	providers = { "lsp", "treesitter", "regex" },
	providers_regex_syntax_allowlist = {},
	providers_regex_syntax_denylist = {},
	should_enable = function()
		return true
	end,
	under_cursor = true,
}

return {
	"RRethy/vim-illuminate",
	lazy = false,
	config = function()
		require("illuminate").configure(opts)
	end,
}

---@see TelescopeOptions https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#customization
local function picker_config(initial_mode)
	return { initial_mode = initial_mode, theme = "ivy" }
end

local insert_picker = picker_config("insert")
local normal_picker = picker_config("normal")

local pickers = {
	todo = normal_picker,
	marks = insert_picker,
	buffers = normal_picker,
	keymaps = insert_picker,
	oldfiles = normal_picker,
	live_grep = insert_picker,
	git_status = normal_picker,
	grep_string = insert_picker,
	colorscheme = insert_picker,
	lsp_document_symbols = insert_picker,
	current_buffer_fuzzy_find = insert_picker,
	find_files = vim.tbl_deep_extend(
		"force",
		insert_picker,
		{ find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" } }
	),
}

return {
	extensions = { package_info = { theme = "ivy" } },
	pickers = pickers,
	defaults = {
		theme = "ivy",
		mappings = require("keys.telescope-kb"),
		initial_mode = "insert",
		prompt_prefix = require("configs.icons").telescope,
	},
}

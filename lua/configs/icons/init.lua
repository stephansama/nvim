--- https://www.nerdfonts.com/cheat-sheet
--- https://wasm.simpleicons.org
local M = {}

M.telescope = "   "

M.indent_blankline = "│"

M.diagnostics = {
	Error = "󰅚 ",
	Warn = "󰀪 ",
	Hint = "󰌶 ",
	Info = " ",
}

M.packageJSON = {
	outdated = "|  ",
	up_to_date = "|  ",
}

M.lualine = {
	modified = "",
	readonly = "",
	unnamed = "󰡯",
	newfile = "",
}

M.mason = {
	package_pending = "󰶻",
	package_installed = "󰄴",
	package_uninstalled = "󰅘",
}

M.lazy = {
	ft = "",
	lazy = "󰂠 ",
	loaded = "",
	not_loaded = "",
}

M.neotest = {
	running_animated = require("configs.icons.neotest").unicode_square,
	watching = "󰈈",
	unknown = "",
	running = "",
	skipped = "",
	notify = "󱈸",
	passed = "",
	failed = "",
	non_collapsible = "─",
	collapsed = "─",
	expanded = "╮",
	child_prefix = "├",
	final_child_prefix = "╰",
	child_indent = "│",
	final_child_indent = " ",
}

M.cmp = {
	Class = " ",
	Color = " ",
	Constant = " ",
	Constructor = " ",
	Enum = " ",
	EnumMember = " ",
	Field = "󰄶 ",
	File = " ",
	Folder = " ",
	Function = "󰊕 ",
	Interface = "󰜰",
	Keyword = "󰌆 ",
	Method = "ƒ ",
	Module = "󰏗 ",
	Property = " ",
	Snippet = "󰘍 ",
	Struct = " ",
	Text = " ",
	Unit = " ",
	Value = "󰎠 ",
	Variable = " ",
}

return M

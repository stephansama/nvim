--- https://www.nerdfonts.com/cheat-sheet
--- https://wasm.simpleicons.org
local M = {}

M.telescope = "   "

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

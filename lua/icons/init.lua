--- https://www.nerdfonts.com/cheat-sheet
--- https://wasm.simpleicons.org
local M = {}

M.telescope = "   "

M.indent_blankline = "│"

M.diagnostics = {
	Error = "󰅙 ",
	Warn = " ",
	Hint = "󰌵 ",
	Info = " ",
}

M.notify = {
	INFO = "",
	WARN = "",
	ERROR = "",
	DEBUG = "",
	TRACE = "✎",
}

M.packageJSON = {
	outdated = "|  ",
	up_to_date = "|  ",
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

M.lualine = {
	modified = "",
	readonly = "",
	unnamed = "󰡯",
	newfile = "",
}

M.neotest = {
	running_animated = require("icons.neotest").unicode_square,
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

return M

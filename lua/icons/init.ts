import * as neotestAscii from "./neotest.json";

export const indent_blankline = "│";

export const diagnostics = {
	Error: "󰅙 ",
	Warn: " ",
	Hint: "󰌵 ",
	Info: " ",
};

export const notify = {
	INFO: "",
	WARN: "",
	ERROR: "",
	DEBUG: "",
	TRACE: "✎",
};

export const packageJSON = {
	outdated: "|  ",
	up_to_date: "|  ",
};

export const mason = {
	package_pending: "󰶻",
	package_installed: "󰄴",
	package_uninstalled: "󰅘",
};

export const lazy = {
	ft: "",
	lazy: "󰂠 ",
	loaded: "",
	not_loaded: "",
};

export const lualine = {
	modified: "",
	readonly: "",
	unnamed: "󰡯",
	newfile: "",
};

export const neotest = {
	running_animated: neotestAscii.unicode_square,
	watching: "󰈈",
	unknown: "",
	running: "",
	skipped: "",
	notify: "󱈸",
	passed: "",
	failed: "",
	non_collapsible: "─",
	collapsed: "─",
	expanded: "╮",
	child_prefix: "├",
	final_child_prefix: "╰",
	child_indent: "│",
	final_child_indent: " ",
};

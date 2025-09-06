import * as spinners from "./spinners.json";

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

export const grug_far = {
	enabled: true,
	fileIconsProvider: "first_available",
	actionEntryBullet: " ",
	searchInput: " ",
	replaceInput: " ",
	filesFilterInput: " ",
	flagsInput: "󰮚 ",
	pathsInput: " ",
	resultsStatusReady: "󱩾 ",
	resultsStatusError: " ",
	resultsStatusSuccess: "󰗡 ",
	resultsActionMessage: "  ",
	resultsEngineLeft: "⟪",
	resultsEngineRight: "⟫",
	resultsChangeIndicator: "┃",
	resultsAddedIndicator: "▒",
	resultsRemovedIndicator: "▒",
	resultsDiffSeparatorIndicator: "┊",
	historyTitle: "   ",
	helpTitle: " 󰘥  ",
	lineNumbersEllipsis: " ",
	newline: " ",
};

export const neotest = {
	running_animated: spinners.unicode_square,
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

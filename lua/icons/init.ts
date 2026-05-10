import * as spinners from "./spinners.json";

export const indent_blankline = "│";

export const diagnostics = {
	Error: "󰅙 ",
	Hint: "󰌵 ",
	Info: " ",
	Warn: " ",
};

export const notify = {
	DEBUG: "",
	ERROR: "",
	INFO: "",
	TRACE: "✎",
	WARN: "",
};

export const packageJSON = {
	outdated: "|  ",
	up_to_date: "|  ",
};

export const mason = {
	package_installed: "󰄴",
	package_pending: "󰶻",
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
	newfile: "",
	readonly: "",
	unnamed: "󰡯",
};

export const grug_far = {
	actionEntryBullet: " ",
	enabled: true,
	fileIconsProvider: "first_available",
	filesFilterInput: " ",
	flagsInput: "󰮚 ",
	helpTitle: " 󰘥  ",
	historyTitle: "   ",
	lineNumbersEllipsis: " ",
	newline: " ",
	pathsInput: " ",
	replaceInput: " ",
	resultsActionMessage: "  ",
	resultsAddedIndicator: "▒",
	resultsChangeIndicator: "┃",
	resultsDiffSeparatorIndicator: "┊",
	resultsEngineLeft: "⟪",
	resultsEngineRight: "⟫",
	resultsRemovedIndicator: "▒",
	resultsStatusError: " ",
	resultsStatusReady: "󱩾 ",
	resultsStatusSuccess: "󰗡 ",
	searchInput: " ",
};

export const grug_spinner = spinners.clock;

export const neotest = {
	child_indent: "│",
	child_prefix: "├",
	collapsed: "─",
	expanded: "╮",
	failed: "",
	final_child_indent: " ",
	final_child_prefix: "╰",
	non_collapsible: "─",
	notify: "󱈸",
	passed: "",
	running: "",
	running_animated: spinners.unicode_square,
	skipped: "",
	unknown: "",
	watching: "󰈈",
};

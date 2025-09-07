local keys = require("keys.plugin")
local icons = require("icons.init")

local opts = {
	debounceMs = 500,
	minSearchChars = 2,
	maxSearchMatches = 2000,
	maxLineLength = 1000,
	breakindentopt = "shift:6",
	normalModeSearch = false,
	searchOnInsertLeave = false,
	maxWorkers = 4,
	rgPath = "rg",
	extraRgArgs = "",
	enabledEngines = { "ripgrep", "astgrep", "astgrep-rules" },
	engines = {
		ripgrep = {
			path = "rg",
			extraArgs = "",
			showReplaceDiff = true,
			placeholders = {
				enabled = true,
				search = "e.g. foo   foo([a-z0-9]*)   fun\\(",
				replacement = "e.g. bar   ${1}_foo   $$MY_ENV_VAR ",
				replacement_lua = 'e.g. if vim.startsWith(match, "use") \\n then return "employ" .. match \\n else return match end',
				replacement_vimscript = 'e.g. return "bob_" .. match',
				filesFilter = "e.g. *.lua   *.{css,js}   **/docs/*.md   (specify one per line)",
				flags = "e.g. --help --ignore-case (-i) --replace= (empty replace) --multiline (-U)",
				paths = "e.g. /foo/bar   ../   ./hello\\ world/   ./src/foo.lua   ~/.config",
			},
		},
		astgrep = {
			path = "ast-grep",
			extraArgs = "",
			placeholders = {
				enabled = true,
				search = "e.g. $A && $A()   foo.bar($$$ARGS)   $_FUNC($_FUNC)",
				replacement = "e.g. $A?.()   blah($$$ARGS)",
				replacement_lua = 'e.g. return vars.A == "blah" and "foo(" .. table.concat(vars.ARGS, ", ") .. ")" or match',
				filesFilter = "e.g. *.lua   *.{css,js}   **/docs/*.md   (specify one per line, filters via ripgrep)",
				flags = "e.g. --help (-h) --debug-query=ast --rewrite= (empty replace) --strictness=<STRICTNESS>",
				paths = "e.g. /foo/bar   ../   ./hello\\ world/   ./src/foo.lua   ~/.config",
			},
		},
		["astgrep-rules"] = {
			path = "ast-grep",
			extraArgs = "",
			languageGlobs = {},
			placeholders = {
				enabled = true,
				rules = "e.g. id: my_rule_1 \\n language: lua\\nrule: \\n  pattern: await $A",
				filesFilter = "e.g. *.lua   *.{css,js}   **/docs/*.md   (specify one per line, filters via ripgrep)",
				flags = "e.g. --help (-h) --debug-query=ast --strictness=<STRICTNESS>",
				paths = "e.g. /foo/bar   ../   ./hello\\ world/   ./src/foo.lua   ~/.config",
			},
		},
	},
	engine = "ripgrep",
	enabledReplacementInterpreters = { "default", "lua", "vimscript" },
	replacementInterpreter = "default",
	windowCreationCommand = "split",
	disableBufferLineNumbers = true,
	helpLine = { enabled = true },
	maxSearchCharsInTitles = 30,
	staticTitle = nil,
	startInInsertMode = true,
	startCursorRow = 2,
	wrap = true,
	transient = false,
	ignoreVisualSelection = false,
	visualSelectionUsage = "prefill-search",
	keymaps = keys.grug_far_internal,
	resultsSeparatorLineChar = "",
	resultsHighlight = true,
	inputsHighlight = true,
	lineNumberLabel = function(params, options)
		local width = math.max(params.max_line_number_length, 3)
		local lineNumbersEllipsis =
			options.icons.enabled and options.icons.lineNumbersEllipsis or " "
		return {
			{
				params.line_number and ("%" .. width .. "s "):format(
					params.line_number
				) or ((" "):rep(width - vim.fn.strdisplaywidth(lineNumbersEllipsis)) .. lineNumbersEllipsis .. " "),
				params.is_current_line and "GrugFarResultsCursorLineNo" or "GrugFarResultsLineNr",
			},
		}
	end,
	filePathConceal = function(params)
		local len = #params.file_path
		local window_width = params.window_width - 8
		if len < params.window_width then return end

		local first_part_len = math.floor(window_width / 3)
		local delta = len - window_width

		return first_part_len, first_part_len + delta
	end,
	filePathConcealChar = "…",
	spinnerStates = icons.grug_spinner,
	reportDuration = true,
	icons = icons.grug_far,
	prefills = {
		search = nil,
		replacement = nil,
		filesFilter = nil,
		flags = nil,
		paths = nil,
	},
	history = {
		maxHistoryLines = 10000,
		historyDir = vim.fn.stdpath("state") .. "/grug-far",
		autoSave = {
			enabled = true,
			onReplace = true,
			onSyncAll = true,
			onBufDelete = true,
		},
	},
	instanceName = nil,
	folding = {
		enabled = true,
		foldlevel = 1,
		foldcolumn = "1",
		include_file_path = false,
	},
	resultLocation = {
		showNumberLabel = true,
		numberLabelPosition = "right_align",
		numberLabelFormat = " [%d]",
	},
	openTargetWindow = {
		exclude = {},
		preferredLocation = "below",
		useScratchBuffer = true,
	},
	helpWindow = {},
	historyWindow = {},
	previewWindow = {},
	smartInputHandling = true,
}

return {
	"MagicDuck/grug-far.nvim",
	config = true,
	keys = require("keys.plugin").grug_far,
	opts = opts,
}

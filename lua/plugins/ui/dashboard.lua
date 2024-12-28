local ASCII_DIR = require("constants.dir").ASCII_DIR
local load_ascii_headers = require("utils.dashboard").load_ascii_headers

local shortcut = {
	{
		key = "u",
		icon = "",
		desc = " Update",
		group = "@variable",
		action = "Lazy update",
		icon_hl = "TodoFgTODO",
	},
	{
		icon = "",
		icon_hl = "TodoFgFIX",
		group = "@variable",
		desc = " Files",
		action = "FzfLua files",
		key = "f",
	},
	{
		icon = "󰈬",
		group = "@variable",
		desc = " Words",
		icon_hl = "TodoFgHACK",
		action = "FzfLua live_grep",
		key = "w",
	},
	{
		icon = "󰌌",
		group = "@variable",
		desc = " Keys",
		icon_hl = "DevIconTerminal",
		action = "FzfLua keymaps",
		key = "k",
	},
	{
		icon = "󰑴",
		icon_hl = "CursorLineNr",
		key = "l",
		desc = " Leetcode",
		action = "Leet",
		group = "@variable",
	},
	{ icon = "", key = "q", action = "qa", desc = " ", group = "@variable", icon_hl = "TodoFgFIX" },
}

local config = {
	header = load_ascii_headers(ASCII_DIR, "txt"),
	footer = function()
		local stats = require("lazy").stats()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		return { " loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
	end,
	mru = { enable = true, limit = 9, icon = " ", label = "Files", cwd_only = true },
	project = { enable = false },
	packages = { enable = false },
	shortcut = shortcut,
}

local opts = {
	theme = "hyper",
	config = config,
	disable_move = true,
	shortcut_type = "number",
	change_to_vcs_root = true,
}

return {
	"nvimdev/dashboard-nvim",
	dependencies = { "ibhagwan/fzf-lua" },
	event = "VimEnter",
	opts = opts,
	keys = require("keys.init").dashboard,
}

vim.pack.add({ { src = "https://github.com/ibhagwan/fzf-lua" } })

local fzf_lua = require("fzf-lua")
local actions = fzf_lua.actions
fzf_lua.setup({
	"default-title",
	winopts = {
		preview = {
			layout = "flex",
			flip_columns = 600,
		},
	},
	keymap = {
		fzf = {
			["alt-s"] = "select-all+accept",
			["alt-q"] = "select+accept",
		},
	},
	files = {
		cwd_prompt = false,
		actions = {
			["alt-i"] = { actions.toggle_ignore },
			["alt-h"] = { actions.toggle_hidden },
		},
	},
	grep = {
		actions = {
			["alt-i"] = { actions.toggle_ignore },
			["alt-h"] = { actions.toggle_hidden },
		},
	},
})

vim.pack.add({ { src = "https://github.com/ibhagwan/fzf-lua" } })

local fzf = require("fzf-lua")

fzf.setup({
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
			["alt-i"] = { fzf.actions.toggle_ignore },
			["alt-h"] = { fzf.actions.toggle_hidden },
		},
	},
	grep = {
		actions = {
			["alt-i"] = { fzf.actions.toggle_ignore },
			["alt-h"] = { fzf.actions.toggle_hidden },
		},
	},
})

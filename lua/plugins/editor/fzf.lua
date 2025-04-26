local opts = function()
	local fzf = require("fzf-lua")
	local actions = fzf.actions
	return {
		"default-title",
		winopts = { preview = { layout = "flex", flip_columns = 600 } },
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
	}
end

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = true,
	opts = opts,
	keys = require("keys.init").fzf_lua,
}

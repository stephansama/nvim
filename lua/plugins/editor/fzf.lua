local opts = {
	"default-title",
	winopts = { preview = { layout = "flex", flip_columns = 600 } },
	keymap = {
		fzf = {
			["alt-s"] = "select-all+accept",
			["alt-q"] = "select+accept",
		},
	},
}

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = true,
	opts = opts,
	keys = require("keys.init").fzf_lua,
}

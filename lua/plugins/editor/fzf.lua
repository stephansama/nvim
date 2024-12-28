local opts = function()
	local actions = require("fzf-lua.actions")
	return {
		"default-title",
		winopts = { preview = { layout = "flex", flip_columns = 600 } },
		actions = {
			["ctrl-p"] = actions.file_sel_to_qf,
			["ctrl-q"] = actions.file_edit_or_qf,
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

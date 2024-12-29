local opts = function()
	return {
		"default-title",
		winopts = { preview = { layout = "flex", flip_columns = 600 } },
	}
end

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = true,
	opts = opts,
	keys = require("keys.init").fzf_lua,
}

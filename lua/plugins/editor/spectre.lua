local spectre_function = require("utils").spectre_function

local keys = {
	{ "<leader>S", spectre_function("toggle"), desc = "Toggle spectre" },
	{ "<leader>sw", spectre_function("open_visual"), desc = "Search current word" },
	{ "<leader>sf", spectre_function("open_file_search"), desc = "Search current file" },
}

return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = keys,
}

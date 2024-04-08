---@param function_name "toggle" | "open_visual" | "open_file_search" name of function to invoke from spectre
---@return function keymap function used to invoke spectre
local spectre_function = function(function_name)
	return function()
		local params = function_name ~= "toggle" and { select_word = true } or {}
		require("spectre")[function_name](params)
	end
end

return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>S", spectre_function("toggle"), desc = "Toggle spectre" },
		{ "<leader>sw", spectre_function("open_visual"), desc = "Search current word" },
		{ "<leader>sf", spectre_function("open_file_search"), desc = "Search current file" },
	},
}

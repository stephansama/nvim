local toggle_process = function(cmd)
	return function()
		require("toggleterm.terminal").Terminal:new({ cmd = cmd, hidden = true }):toggle()
	end
end

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		autochdir = true,
		direction = "float",
		float_opts = { border = "rounded" },
		open_mapping = [[<c-\>]],
		close_on_exit = true,
	},
	config = true,
	keys = {
		{ "<C-\\>", "ToggleTerm" },
		{ "<leader>go", toggle_process("lazygit"), desc = "Open Lazygit" },
		{ "<leader>no", toggle_process("node"), desc = "Open node terminal" },
	},
}

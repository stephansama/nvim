return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		autochdir = true,
		direction = "float",
		float_opts = { border = "single" },
		open_mapping = [[<c-\>]],
		close_on_exit = true,
	},
	init = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local nodeTerminal = Terminal:new({ cmd = "node", hidden = true })
		vim.keymap.set("n", "<leader>no", function()
			nodeTerminal:toggle()
		end, { desc = "Open Node terminal" })
	end,
	config = function(_, opts)
		require("toggleterm").setup(opts)
	end,
}

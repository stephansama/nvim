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
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
		vim.keymap.set("n", "<leader>go", function()
			lazygit:toggle()
		end, { desc = "Open Lazygit terminal" })
	end,
	config = function(_, opts)
		require("toggleterm").setup(opts)
	end,
}

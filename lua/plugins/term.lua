local expand_keymaps = require("utils").expand_keymaps

local init = function()
	local Terminal = require("toggleterm.terminal").Terminal
	local nodeTerminal = Terminal:new({ cmd = "node", hidden = true })
	local lazygitTerminal = Terminal:new({ cmd = "lazygit", hidden = true })

	local toggleTerm = function(term)
		return function()
			term:toggle()
		end
	end

	expand_keymaps({
		n = {
			["<leader>go"] = { toggleTerm(lazygitTerminal), "Open Lazygit" },
			["<leader>no"] = { toggleTerm(nodeTerminal), "Open node terminal" },
		},
	})
end

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
	init = init,
	config = true,
}

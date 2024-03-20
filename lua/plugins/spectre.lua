local expand_keymaps = require("utils").expand_keymaps

local init = function()
	local spectre = require("spectre")

	local spectre_toggle = function()
		spectre.toggle()
	end

	local spectre_file = function()
		spectre.open_file_search({ select_word = true })
	end

	local spectre_search = function(useWord)
		return function()
			spectre.open_visual({ select_word = useWord or false })
		end
	end

	expand_keymaps({
		n = {
			["<leader>S"] = { spectre_toggle, "Toggle Spectre" },
			["<leader>sw"] = { spectre_search(true), "Search current word" },
			["<leader>sf"] = { spectre_file, "Search on current file" },
		},
		v = {
			["<leader>sw"] = { spectre_search(false), "Search current word" },
		},
	})
end

return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = init,
}

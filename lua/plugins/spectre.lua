local expand_keymaps = require("utils").expand_keymaps

return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		local spectre = require("spectre")

		local spectre_toggle = function()
			spectre.toggle()
		end

		local spectre_file = function()
			spectre.open_file_search({ select_word = true })
		end

		---search spectre
		---@param useWord boolean
		---@return function
		local spectre_search = function(useWord)
			local opts = {}
			if useWord then
				opts.select_word = true
			end
			return function()
				spectre.open_visual(opts)
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
	end,
}

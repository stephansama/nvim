local expand_keymaps = require("utils").expand_keymaps

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		local harpoon_toggle = function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end

		local harpoon_remove = function(number)
			local buffer_name = "harpoon buffer " .. number
			return {
				function()
					harpoon:list():removeAt(number)
					print("Removing " .. buffer_name)
				end,
				"Remove " .. buffer_name,
			}
		end

		local harpoon_select = function(number)
			local buffer_name = "harpoon buffer " .. number
			return {
				function()
					harpoon:list():select(number)
					print("Switched to " .. buffer_name)
				end,
				"Select " .. buffer_name,
			}
		end

		local clear_harpoon = function()
			harpoon:list():clear()
			print("Clearing harpoon list...")
		end

		--- modify the harpoon buffer list
		---@param direction 'append' | 'prepend' | 'remove'
		---@return table
		local harpoon_modify = function(direction)
			local additions = { append = 1, prepend = 1 }
			local description = direction:gsub("^%l", string.upper)
				.. " "
				.. ((additions[direction] ~= nil) and "to" or "from")
				.. " harpoon"
			local action = function()
				if direction == "append" then
					harpoon:list():append()
				elseif direction == "prepend" then
					harpoon:list():prepend()
				else
					harpoon:list():remove()
				end
			end
			return {
				function()
					action()
					print(description)
				end,
				description,
			}
		end

		expand_keymaps({
			n = {
				["<leader>R"] = harpoon_modify("remove"),
				["<leader>a"] = harpoon_modify("append"),
				["<leader>A"] = harpoon_modify("prepend"),
				["<leader>p"] = { harpoon_toggle, "Open harpoon list" },
				["<leader>ch"] = { clear_harpoon, "Clear harpoon list" },
				["<leader>1"] = harpoon_select(1),
				["<leader>2"] = harpoon_select(2),
				["<leader>3"] = harpoon_select(3),
				["<leader>4"] = harpoon_select(4),
				["<leader>r1"] = harpoon_remove(1),
				["<leader>r2"] = harpoon_remove(2),
				["<leader>r3"] = harpoon_remove(3),
				["<leader>r4"] = harpoon_remove(4),
			},
		})
	end,
}

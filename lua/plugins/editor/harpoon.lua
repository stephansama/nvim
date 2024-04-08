--- modify the harpoon buffer list
---@param direction 'append' | 'prepend' | 'remove'
local harpoon_modify = function(direction)
	local additions = { append = 1, prepend = 1 }
	local description = direction:gsub("^%l", string.upper)
		.. " "
		.. ((additions[direction] ~= nil) and "to" or "from")
		.. " harpoon"
	local action = function()
		local harpoon = require("harpoon")
		if direction == "append" then
			harpoon:list():append()
		elseif direction == "prepend" then
			harpoon:list():prepend()
		else
			harpoon:list():remove()
		end
	end
	return function()
		action()
		print(description)
	end
end

local harpoon_remove = function(number)
	local buffer_name = "harpoon buffer " .. number
	return function()
		local harpoon = require("harpoon")
		harpoon:list():removeAt(number)
		print("Removing " .. buffer_name)
	end
end

local harpoon_select = function(number)
	local buffer_name = "harpoon buffer " .. number
	return function()
		local harpoon = require("harpoon")
		harpoon:list():select(number)
		print("Switched to " .. buffer_name)
	end
end

local harpoon_toggle = function()
	return function()
		local harpoon = require("harpoon")
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end
end

local clear_harpoon = function()
	return function()
		local harpoon = require("harpoon")
		harpoon:list():clear()
		print("Clearing harpoon list...")
	end
end

return {
	"ThePrimeagen/harpoon",
	-- lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	branch = "harpoon2",
	opts = {},
	config = function(_, opts)
		require("harpoon"):setup(opts)
	end,
	keys = {
		{ "<leader>R", harpoon_modify("remove"), desc = "Remove current buffer" },
		{ "<leader>a", harpoon_modify("append"), desc = "Append buffer to harpoon" },
		{ "<leader>A", harpoon_modify("prepend"), desc = "Prepend buffer to harpoon" },
		{ "<leader>p", harpoon_toggle(), desc = "Open harpoon list" },
		{ "<leader>cp", clear_harpoon(), desc = "Clear harpoon" },
		{ "<leader>1", harpoon_select(1), desc = "Switch to Buffer 1" },
		{ "<leader>2", harpoon_select(2), desc = "Switch to Buffer 2" },
		{ "<leader>3", harpoon_select(3), desc = "Switch to Buffer 3" },
		{ "<leader>4", harpoon_select(4), desc = "Switch to Buffer 4" },
		{ "<leader>r1", harpoon_remove(1), desc = "Remove Buffer 1" },
		{ "<leader>r2", harpoon_remove(2), desc = "Remove Buffer 2" },
		{ "<leader>r3", harpoon_remove(3), desc = "Remove Buffer 3" },
		{ "<leader>r4", harpoon_remove(4), desc = "Remove Buffer 4" },
	},
}

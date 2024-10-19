local M = {}

--- modify the harpoon buffer list
---@param direction 'append' | 'prepend' | 'remove'
M.harpoon_modify = function(direction)
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

M.harpoon_remove = function(number)
	local buffer_name = "harpoon buffer " .. number
	return function()
		local harpoon = require("harpoon")
		harpoon:list():removeAt(number)
		print("Removing " .. buffer_name)
	end
end

M.harpoon_select = function(number)
	local buffer_name = "harpoon buffer " .. number
	return function()
		local harpoon = require("harpoon")
		harpoon:list():select(number)
		print("Switched to " .. buffer_name)
	end
end

M.harpoon_toggle = function()
	return function()
		local harpoon = require("harpoon")
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end
end

M.clear_harpoon = function()
	return function()
		local harpoon = require("harpoon")
		harpoon:list():clear()
		print("Clearing harpoon list...")
	end
end

return M

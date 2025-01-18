local M = {}

M.icons = require("icons").neotest

-- https://github.com/nvim-neotest/neotest?tab=readme-ov-file#supported-runners
M.adapters = {
	require("rustaceanvim.neotest"),
	require("neotest-vitest")({
		filter_dir = function(name, rel_path, root)
			local full_path = root .. "/" .. rel_path

			if root:match("srandle-blog") then
				if full_path:match("__tests__") then
					return true
				else
					return false
				end
			else
				return name ~= "node_modules"
			end
		end,
	}),
	require("neotest-playwright").adapter({
		options = { persist_project_selection = true, enable_dynamic_test_discovery = true },
	}),
}

return M

local opts = function()
	local M = {}

	M.icons = require("icons").neotest

	-- https://github.com/nvim-neotest/neotest?tab=readme-ov-file#supported-runners
	M.adapters = {
		require("rustaceanvim.neotest"),
		require("neotest-vitest")({
			filter_dir = function(name, rel_path, root)
				local full_path = root .. "/" .. rel_path

				if root:match("srandle-blog") then
					return full_path:match("__tests__") ~= nil
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
end

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"mrcjkb/rustaceanvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
		"thenbe/neotest-playwright",
	},
	config = true,
	keys = require("keys.plugin").neotest,
	opts = opts,
}

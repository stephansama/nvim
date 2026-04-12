vim.pack.add({
	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/marilari88/neotest-vitest" },
	{ src = "https://github.com/thenbe/neotest-playwright" },
})

require("neotest").setup({
	icons = require("icons").neotest,
	adapters = { -- require("rustaceanvim.neotest"),
	require("neotest-vitest")({ filter_dir = function(name, rel_path, root)
		local full_path = root .. "/" .. rel_path

		if root:match("srandle-blog") then
			return full_path:match("__tests__") ~= nil
		else
			return name ~= "node_modules"
		end
	end }), require("neotest-playwright").adapter({
		options = {
			persist_project_selection = true,
			enable_dynamic_test_discovery = true,
		},
	}) },
})

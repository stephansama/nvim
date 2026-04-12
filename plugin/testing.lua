vim.pack.add({
	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/marilari88/neotest-vitest" },
	{ src = "https://github.com/thenbe/neotest-playwright" },
})

require("neotest").setup({
	icons = require("icons").neotest,
	adapters = {
		vim.tbl_contains(
			require("lang.enabled").enabled,
			"rust"
		) and require("rustaceanvim.neotest") or nil,
		require("neotest-vitest")({ filter_dir = function(name)
			return name ~= "node_modules"
		end }),
		require("neotest-playwright").adapter({
			options = {
				persist_project_selection = true,
				enable_dynamic_test_discovery = true,
			},
		}),
	},
})

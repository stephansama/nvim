local expand_keymaps = require("utils").expand_keymaps

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- "nvim-neotest/neotest-jest",
		-- "antoinemadec/FixCursorHold.nvim",
	},
	init = function()
		local neotest = require("neotest")

		local toggle_summary = function()
			neotest.summary.toggle()
		end

		local open_output = function()
			neotest.output.open()
		end

		local run_tests = function()
			neotest.run.run()
		end

		expand_keymaps({
			n = {
				["<leader>ts"] = { toggle_summary, "Open test summary" },
				["<leader>th"] = { open_output, "Open output" },
				["<leader>tr"] = { run_tests, "Run Neotest" },
			},
		})
	end,
	config = function()
		require("neotest").setup({
			adapters = {
				require("rustaceanvim.neotest"),
				-- require("neotest-jest")({
				-- 	-- watch tests
				-- 	-- jestCommand = require('neotest-jest.jest-util').getJestCommand(vim.fn.expand '%:p:h')
				-- 	jestCommand = "npm test --",
				-- 	-- jestConfigFile = "custom.jest.config.ts",
				-- 	env = { CI = true },
				-- 	cwd = function()
				-- 		return vim.fn.getcwd()
				-- 	end,
				-- }),
			},
		})
	end, --
	-- opts = ,
}

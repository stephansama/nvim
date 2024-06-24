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
	keys = {
		{
			"<leader>rt",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Neotest: Run test in current file",
		},
		{
			"<C-\\>",
			function()
				vim.cmd([[Neotest summary]])
			end,
			desc = "Neotest summary",
		},
		{ "<leader>ro", "<cmd>Neotest output<CR>", desc = "Open Neotest output" },
		{ "<leader>rp", "<cmd>Neotest output-panel<CR>", desc = "Open Neotest output-panel" },
	},
	opts = function()
		return {
			-- https://github.com/nvim-neotest/neotest?tab=readme-ov-file#supported-runners
			adapters = {
				require("rustaceanvim.neotest"),
				require("neotest-vitest")({
					-- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
					-- filter_dir = function(name, rel_path, root)
					-- 	return name ~= "node_modules"
					-- end,
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
					options = {
						persist_project_selection = true,
						enable_dynamic_test_discovery = true,
					},
				}),
			},
			icons = {
				-- Ascii:
				-- { "/", "|", "\\", "-", "/", "|", "\\", "-"},
				-- Unicode:
				-- { "", "🞅", "🞈", "🞉", "", "", "🞉", "🞈", "🞅", "", },
				-- {"◴" ,"◷" ,"◶", "◵"},
				-- {"◢", "◣", "◤", "◥"},
				-- {"◐", "◓", "◑", "◒"},
				-- {"◰", "◳", "◲", "◱"},
				-- {"⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"},
				-- {"⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"},
				-- {"⠋", "⠙", "⠚", "⠞", "⠖", "⠦", "⠴", "⠲", "⠳", "⠓"},
				-- {"⠄", "⠆", "⠇", "⠋", "⠙", "⠸", "⠰", "⠠", "⠰", "⠸", "⠙", "⠋", "⠇", "⠆"},
				-- { "⠋", "⠙", "⠚", "⠒", "⠂", "⠂", "⠒", "⠲", "⠴", "⠦", "⠖", "⠒", "⠐", "⠐", "⠒", "⠓", "⠋" },
				running_animated = { "◴", "◷", "◶", "◵" },
				watching = "󰈈",
				unknown = "",
				running = "",
				skipped = "",
				notify = "󱈸",
				passed = "",
				failed = "",
				non_collapsible = "─",
				collapsed = "─",
				expanded = "╮",
				child_prefix = "├",
				final_child_prefix = "╰",
				child_indent = "│",
				final_child_indent = " ",
			},
		}
	end,
}

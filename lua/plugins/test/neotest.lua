return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
		"mrcjkb/rustaceanvim",
	},
	config = true,
	keys = {
		{
			"<leader>rt",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run test in current file",
		},
		{
			"<C-\\>",
			function()
				vim.cmd([[Neotest summary]])
			end,
			desc = "Neotest summary",
		},
		{ "<leader>ro", "<cmd>Neotest output<CR>", desc = "Neotest output" },
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
				running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
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

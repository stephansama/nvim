return {
	{ "chentoast/marks.nvim", event = "VimEnter", opts = { sign_priority = 90 } },
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	{
		"f-person/auto-dark-mode.nvim",
		keys = { { "<leader>th", "<cmd>Lazy load auto-dark-mode.nvim<cr>" } },
		opts = {
			update_interval = 1000,
			set_dark_mode = function()
				vim.api.nvim_set_option("background", "dark")
				vim.cmd("colorscheme catppuccin-mocha")
				vim.api.nvim_command("!kitten themes --reload-in=all Catppuccin-Mocha")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option("background", "light")
				vim.cmd("colorscheme catppuccin-latte")
				vim.api.nvim_command("!kitten themes --reload-in=all Catppuccin-Latte")
			end,
		},
	},
}

return {
	{
		"dhruvasagar/vim-table-mode",
		ft = "markdown",
		event = "VeryLazy",
		init = function()
			vim.g.table_mode_tableize_map = "<leader>mc"
		end,
		config = function()
			vim.keymap.set("n", "<leader>mt", vim.cmd.TableModeEnable, { desc = "Enable Table Mode" })
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>")
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("configs.obsidian-opts")
		end,
		config = true,
	},
}

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
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "markdown.mdx" },
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>")
		end,
	},
}

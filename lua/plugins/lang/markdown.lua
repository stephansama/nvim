return { {
	"dhruvasagar/vim-table-mode",
	ft = "markdown",
	config = function() end,
	keys = require("keys.plugin").table_mode,
	init = function()
		vim.g.table_mode_tableize_map = "<leader>mc"
	end,
}, {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown", "markdown.mdx" },
	opts = {},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}, {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown" },
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	keys = require("keys.plugin").markdownpreview,
} }

if not vim.tbl_contains(
	require("lang.enabled").enabled,
	"markdown"
) then return end

vim.pack.add({
	{ src = "https://github.com/dhruvasagar/vim-table-mode" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/iamcco/markdown-preview.nvim" },
})

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

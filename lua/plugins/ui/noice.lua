return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		lsp = {
			hover = { silent = true },
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		views = {
			cmdline_popup = {
				position = { row = 5, col = "50%" },
				size = { width = 60, height = "auto" },
			},
		},
		presets = {
			long_message_to_split = true,
			lsp_doc_border = true,
		},
	},
}

local filename_symbols = {
	modified = "",
	readonly = "",
	unnamed = "󰡯",
	newfile = "",
}

local lualine_opts = {
	options = {
		globalstatus = true,
		theme = "catppuccin",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_c = {
			{
				"filename",
				file_status = true,
				newfile_status = true,
				path = 3,
				symbols = filename_symbols,
			},
		},
	},
}

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		opts = { transparent_background = true },
		priority = 1000,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = lualine_opts,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- popupmenu = {
			-- 	backend = "cmp",
			-- },
			views = {
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
			},
			presets = {
				-- inc_rename = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		},
	},
}

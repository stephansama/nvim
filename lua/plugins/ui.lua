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

local exclude_filetypes = {
	"alpha",
	"neo-tree",
	"Trouble",
	"trouble",
	"lazy",
	"mason",
	"notify",
	"toggleterm",
	"lazyterm",
	"lspinfo",
	"packer",
	"checkhealth",
	"help",
	"man",
	"gitcommit",
	"TelescopePrompt",
	"TelescopeResults",
	"dashboard",
}

local ibl_config = {
	-- use to switch back to every line being colored
	-- indent = { highlight = highlight },
	scope = { enabled = false },
	exclude = {
		buftypes = { "terminal", "nofile", "quickfix", "prompt" },
		filetypes = exclude_filetypes,
	},
}

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		opts = {
			transparent_background = true,
			show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
			integrations = {
				cmp = true,
				gitsigns = true,
				harpoon = true,
				indent_blankline = true,
				mason = true,
				neotree = true,
				noice = true,
				ufo = true,
				telescope = true,
				lsp_trouble = true,
				illuminate = true,
				treesitter = true,
				dashboard = true,
				notify = false,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					-- inlay_hints = {
					-- 	background = true,
					-- },
				},
			},
		},
		priority = 1000,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = lualine_opts,
	},
	{ "chentoast/marks.nvim", event = "VimEnter", opts = { sign_priority = 90 } },
	{
		"lewis6991/gitsigns.nvim",
		init = function()
			require("gitsigns").setup(require("configs.gitsigns-opts"))
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User FilePost",
		main = "ibl",
		lazy = false,
		opts = ibl_config,
		config = true,
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		ft = "*",
		opts = { symbol = "│", options = { try_as_border = true } },
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = exclude_filetypes,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	--- dressing
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
		keys = {
			{
				"<leader>th",
				"<CMD>Lazy load auto-dark-mode.nvim<CR>",
			},
		},
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
	{
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
	},
}

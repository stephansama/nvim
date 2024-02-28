local plugins = {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		lazy = false,
		init = function()
			require("onedarkpro").setup({
				options = {
					transparency = true,
				},
			})
			vim.cmd([[colorscheme onedark]])
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		config = function()
			require("dashboard").setup({
				config = {
					project = {
						enable = true,
						limit = 4,
						-- icon = "your icon",
						label = "Recent directories",
						action = "Telescope find_files cwd=",
					},
					mru = { limit = 5 },
					footer = {}, -- footer
					header = {
						"        ▄▄▄▄▄███████████████████▄▄▄▄▄     ",
						"      ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄   ",
						"     █▀████████▄             ▀▀████ ▀██▄  ",
						"    █▄▄██████████████████▄▄▄         ▄██▀ ",
						"     ▀█████████████████████████▄    ▄██▀  ",
						"       ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀    ",
						"         ▀███▄              ▀██████▀      ",
						"           ▀██████▄        ▄████▀         ",
						"              ▀█████▄▄▄▄▄▄▄███▀           ",
						"                ▀████▀▀▀████▀             ",
						"                  ▀███▄███▀               ",
						"                     ▀█▀                  ",
					},
				},
			})
		end,
	},
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	init = function()
	-- 		require("plugins.configs.onedark")
	-- 	end,
	-- },
	{ "nvim-lua/plenary.nvim", lazy = false },
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function()
			return require("plugins.configs.mason").opts
		end,
		config = function(_, opts)
			require("plugins.configs.mason").config(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		lazy = false,
		opts = function()
			return require("plugins.configs.mason").lspopts
		end,
		config = function(_, opts)
			require("plugins.configs.mason").lspconfig(opts)
		end,
	},
	{
		"mfussenegger/nvim-lint",
		init = function()
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
		config = function()
			require("lint").linters_by_ft = {
				-- markdown = { "vale" },
			}
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
		},
		event = "User FilePost",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},
	-- TODO: remove as this has been deprecated
	{
		"lvimuser/lsp-inlayhints.nvim",
		init = function()
			vim.keymap.set("n", "<leader>ti", function()
				require("lsp-inlayhints").toggle()
			end, { desc = "Toggle inlay hints" })
			-- vim.cmd([[hi LspInlayHint guifg=#A9A9A9 guibg=none]])
		end,
		config = function()
			require("lsp-inlayhints").setup()
		end,
	},
	-- GIT
	{
		"lewis6991/gitsigns.nvim",
		init = function()
			require("plugins.configs.gitsigns")
		end,
	},
	{
		"sindrets/diffview.nvim",
		lazy = false,
		init = function()
			vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>")
			vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>")
		end,
		config = function()
			require("diffview").setup({
				view = {
					default = {
						layout = "diff2_vertical",
					},
				},
				file_panel = {
					listing_style = "tree",
					tree_options = { flatten_dirs = false, folder_statuses = "only_folded" },
					win_config = {
						position = "right",
						width = 35,
						win_opts = {},
					},
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		lazy = false,
		event = "User FilePost",
		opts = function()
			return require("plugins.configs.indent-blankline").opts
		end,
		config = function(_, opts)
			require("plugins.configs.indent-blankline").config(opts)
		end,
	},
	{
		"RRethy/vim-illuminate",
		lazy = false,
		config = function()
			require("plugins.configs.illuminate")
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			require("plugins.configs.lualine")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("plugins.configs.neo-tree").window_picker()
				end,
			},
		},
		init = function()
			require("plugins.configs.neo-tree").init()
		end,
		config = function()
			require("plugins.configs.neo-tree").config()
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = function()
			require("plugins.configs.harpoon").config()
		end,
	},
	{
		"mg979/vim-visual-multi",
		lazy = false,
		init = function()
			vim.g.VM_leader = "<space>"
			vim.keymap.set("n", "<C-j>", "<Plug>(VM-Add-Cursor-Down)")
			vim.keymap.set("n", "<C-k>", "<Plug>(VM-Add-Cursor-Up)")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)

					-- vscode format
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

					-- snipmate format
					require("luasnip.loaders.from_snipmate").load()
					require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

					-- lua format
					require("luasnip.loaders.from_lua").load()
					require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })

					vim.api.nvim_create_autocmd("InsertLeave", {
						callback = function()
							if
								require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
								and not require("luasnip").session.jump_active
							then
								require("luasnip").unlink_current()
							end
						end,
					})
				end,
			},
			{
				"windwp/nvim-autopairs",
				opts = { fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } },
				config = function(_, opts)
					require("plugins.configs.cmp").autopairs(opts)
				end,
			},
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("plugins.configs.cmp").opts
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("plugins.configs.conform")
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		dependencies = { "windwp/nvim-ts-autotag" },
		opts = function()
			return require("plugins.configs.treesitter").opts
		end,
		config = function(_, opts)
			vim.opt.runtimepath:append("$HOME/.local/share/treesitter")
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		lazy = false,
		init = function()
			require("plugins.configs.treesitter").context_init()
		end,
		config = function()
			require("plugins.configs.treesitter").context_config()
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		cmd = "Telescope",
		opts = function()
			return require("plugins.configs.telescope").opts
		end,
		config = function(_, opts)
			require("plugins.configs.telescope").config(opts)
		end,
		init = function()
			require("plugins.configs.telescope").init()
		end,
	},
	{
		"folke/todo-comments.nvim",
		ft = "*,!nvdash",
		lazy = false,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		init = function()
			require("plugins.configs.todo-comments")
		end,
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"mbbill/undotree",
		lazy = false,
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
			vim.g.undotree_WindowLayout = 3
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
	-- AI
	{ "TabbyML/vim-tabby", lazy = false },
	-- Rust
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		event = "BufReadPost",
		ft = { "rust" },
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.rustaceanvim")
		end,
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	},
	-- Web Dev
	{ "windwp/nvim-ts-autotag" },
	{ "ellisonleao/dotenv.nvim" },
	{
		"mattn/emmet-vim",
		ft = { "html", "astro", "svelte", "typescriptreact", "tsx", "javascriptreact", "jsx" },
	},
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		config = function()
			require("tailwindcss-colors").setup()
		end,
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		ft = "rest",
		config = function()
			require("plugins.configs.rest")
		end,
	},
	-- Markdown
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
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.configs.obsidian")
		end,
	},
}

local options = require("plugins.options")

require("lazy").setup(plugins, options)

local parser_install_dir = "$HOME/.local/share/treesitter"

local filetypes = require("utils.globals").web_filetypes

local treesitter_config = {
	parser_install_dir = parser_install_dir,
	auto_install = false,
	sync_install = false,
	autotag = {
		enable_close_on_slash = true,
		enable_close = true,
		enable_rename = true,
		enable = true,
		filetypes = filetypes,
	},
	highlight = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<leader>ss",
			scope_incremental = "<leader>sc",
			node_incremental = "<leader>si",
			node_decremental = "<leader>sd",
		},
	},
	ensure_installed = {
		-- systems programming
		"c",
		"cpp",
		"cmake",
		"c_sharp",
		"dockerfile",
		"rust",
		"go",
		"gomod",
		"gosum",
		"tmux",
		-- lua
		"lua",
		"luadoc",
		-- web technologies
		"css",
		"html",
		"http",
		-- javascript
		"astro",
		"svelte",
		"templ",
		"jsdoc",
		"javascript",
		"typescript",
		"tsx",
		"vue",
		-- data
		"sql",
		"xml",
		"json",
		"yaml",
		"toml",
		"graphql",
		-- note taking
		"markdown",
		"markdown_inline",
		"vim",
		"vimdoc",
		"query",
	},
}

local treesitter_context_config = {
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		dependencies = { { "windwp/nvim-ts-autotag", ft = filetypes } },
		opts = treesitter_config,
		config = function(_, opts)
			vim.opt.runtimepath:append(parser_install_dir)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		lazy = false,
		init = function()
			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context(vim.v.count1)
			end, { silent = true })
		end,
		opts = treesitter_context_config,
		config = true,
	},
	{
		"hedyhli/outline.nvim",
		config = true,
		keys = { { "|", "<CMD>Outline<CR>", desc = "Toggle Outline" } },
	},
}

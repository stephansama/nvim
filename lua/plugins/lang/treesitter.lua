local parser_install_dir = "$HOME/.local/share/treesitter"

local filetypes = require("utils.globals").web_filetypes

local treesitter_config = {
	parser_install_dir = parser_install_dir,
	auto_install = false,
	sync_install = false,
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

return {
	{ "hedyhli/outline.nvim", config = true, keys = { { "|", "<CMD>Outline<CR>", desc = "Toggle Outline" } } },
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		dependencies = { { "windwp/nvim-ts-autotag", ft = filetypes, config = true } },
		opts = treesitter_config,
		config = function(_, opts)
			vim.opt.runtimepath:append(parser_install_dir)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}

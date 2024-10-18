local configure_telescope = require("utils").configure_telescope

return {
	{
		"Equilibris/nx.nvim",
		config = true,
		opts = { nx_cmd_root = "npx nx" },
		keys = { { "<leader>nx", "<cmd>Telescope nx actions theme=ivy<CR>", desc = "nx actions" } },
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"camgraff/telescope-tmux.nvim",
		keys = {
			{
				"<leader>tw",
				"<cmd>Telescope tmux windows theme=ivy<CR>",
				desc = "Find tmux windows",
			},
			{
				"<leader>ts",
				"<cmd>Telescope tmux sessions initial_mode=normal theme=ivy<CR>",
				desc = "Find tmux sessions",
			},
			{
				"<leader>tp",
				"<cmd>Telescope tmux pane_contents theme=ivy<CR>",
				desc = "Find tmux pane contents",
			},
		},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = false },
	{
		"ziontee113/icon-picker.nvim",
		config = true,
		opts = { disable_legacy_commands = true },
		keys = {
			{ "<leader><leader>i", "<cmd>IconPickerNormal<cr>", desc = "IconPickerNormal" },
			{ "<leader><leader>y", "<cmd>IconPickerYank<cr>", desc = "IconPickerYank" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		cmd = "Telescope",
		opts = function()
			return require("configs.telescope-opts")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			{ "isak102/telescope-git-file-history.nvim", dependencies = { "tpope/vim-fugitive" } },
		},
		config = configure_telescope({
			"fzf",
			"tmux",
			"macros",
			"package_info",
			"git_file_history",
		}),
		keys = {
			{ "<leader><Tab>", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
			{ "<leader>fls", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Find symbols" },
			{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find keymaps" },
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
			{ "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "Find word" },
			{ "<leader>fe", "<cmd>Telescope grep_string<CR>", desc = "Find exact word" },
			{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Find oldfiles" },
			{ "<leader>ft", "<cmd>Telescope colorscheme<CR>", desc = "Change colorscheme" },
			{ "<leader>fm", "<cmd>Telescope marks<CR>", desc = "Find marks" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Find within git status" },
			{
				"<leader>go",
				"<cmd>Telescope git_file_history theme=ivy initial_mode=normal<CR>",
				desc = "Find exact word",
			},
			{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find within current buffer" },
		},
	},
}

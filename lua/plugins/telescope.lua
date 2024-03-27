local function picker_config(theme, initial_mode)
	return { theme = theme, initial_mode = initial_mode }
end

local insert_picker = picker_config("dropdown", "insert")
local normal_picker = picker_config("dropdown", "normal")

local telescope_config = {
	defaults = { prompt_prefix = "   ", initial_mode = "insert" },
	pickers = {
		todo = normal_picker,
		marks = insert_picker,
		buffers = normal_picker,
		keymaps = insert_picker,
		oldfiles = normal_picker,
		live_grep = insert_picker,
		grep_string = insert_picker,
		colorscheme = insert_picker,
		git_status = normal_picker,
		lsp_document_symbols = insert_picker,
		current_buffer_fuzzy_find = insert_picker,
		find_files = vim.tbl_deep_extend(
			"force",
			insert_picker,
			{ find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" } }
		),
	},
}

return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = false },
	{
		"ziontee113/icon-picker.nvim",
		config = true,
		opts = { disable_legacy_commands = true },
		keys = {
			{ "<leader><leader>i", "<cmd>IconPickerNormal<cr>", desc = "IconPickerNormal" },
			{ "<leader><leader>y", "<cmd>IconPickerYank<cr>", desc = "IconPickerYank" },
			-- { "<C-i>", "<cmd>IconPickerInsert<cr>", mode = "i", desc = "IconPickerInsert" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
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
			{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find within current buffer" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup(telescope_config)
			telescope.load_extension("fzf")
			telescope.load_extension("package_info")
		end,
	},
}

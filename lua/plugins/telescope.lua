local function picker_config(theme, initial_mode)
	return { theme = theme, initial_mode = initial_mode }
end

local insert_picker = picker_config("dropdown", "insert")
local normal_picker = picker_config("dropdown", "normal")

local telescope_config = {
	defaults = {
		prompt_prefix = "   ",
		initial_mode = "insert",
	},
	pickers = {
		keymaps = insert_picker,
		find_files = vim.tbl_deep_extend("force", insert_picker, {
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		}),
		live_grep = insert_picker,
		grep_string = insert_picker,
		colorscheme = insert_picker,
		oldfiles = normal_picker,
		buffers = normal_picker,
		git_status = normal_picker,
		lsp_document_symbols = insert_picker,
		current_buffer_fuzzy_find = insert_picker,
		todo = normal_picker,
		marks = insert_picker,
	},
}

return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = false },
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.keymap.set("n", "<leader><Tab>", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Find keymaps" })
			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
			vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Find word" })
			vim.keymap.set("n", "<leader>fe", "<cmd>Telescope grep_string<CR>", { desc = "Find exact word" })
			vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find oldfiles" })
			vim.keymap.set("n", "<leader>fls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Find symbols" })
			vim.keymap.set("n", "<leader>ft", "<cmd>Telescope colorscheme<CR>", { desc = "Change colorscheme" })
			vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Find marks" })
			vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Find within git status" })
			vim.keymap.set(
				"n",
				"<leader>fs",
				"<cmd>Telescope current_buffer_fuzzy_find<CR>",
				{ desc = "Find within current buffer" }
			)
		end,
		config = function()
			local telescope = require("telescope")
			telescope.setup(telescope_config)
			telescope.load_extension("fzf")
		end,
	},
}

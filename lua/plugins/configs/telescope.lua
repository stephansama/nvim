local M = {}

-- local telescope =
-- local actions = require("telescope.actions")
-- local trouble = require("trouble.providers.telescope")
--
-- local async = require("plenary.async")
-- local telescope = require("telescope.builtin")

M.opts = {
	defaults = vim.tbl_extend(
		"force",
		require("telescope.themes").get_dropdown(), -- or get_cursor, get_ivy
		{
			prompt_prefix = "   ",
			initial_mode = "normal",
		}
	),
	pickers = {
		keymaps = { initial_mode = "insert" },
		live_grep = { initial_mode = "insert" },
		find_files = { initial_mode = "insert" },
		current_buffer_fuzzy_find = { initial_mode = "insert" },
	},
}
-- M.options = {
-- 	defaults = {
-- 		vimgrep_arguments = {
-- 			"rg",
-- 			"-L",
-- 			"--color=never",
-- 			"--no-heading",
-- 			"--with-filename",
-- 			"--line-number",
-- 			"--column",
-- 			"--smart-case",
-- 		},
-- 		prompt_prefix = "   ",
-- 		selection_caret = "  ",
-- 		entry_prefix = "  ",
-- 		initial_mode = "insert",
-- 		selection_strategy = "reset",
-- 		sorting_strategy = "ascending",
-- 		layout_strategy = "horizontal",
-- 		layout_config = {
-- 			horizontal = {
-- 				prompt_position = "top",
-- 				preview_width = 0.55,
-- 				results_width = 0.8,
-- 			},
-- 			vertical = {
-- 				mirror = false,
-- 			},
-- 			width = 0.87,
-- 			height = 0.80,
-- 			preview_cutoff = 120,
-- 		},
-- 		file_sorter = require("telescope.sorters").get_fuzzy_file,
-- 		file_ignore_patterns = { "node_modules" },
-- 		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
-- 		path_display = { "truncate" },
-- 		winblend = 0,
-- 		border = {},
-- 		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
-- 		color_devicons = true,
-- 		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
-- 		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
-- 		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
-- 		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
-- 		-- Developer configurations: Not meant for general override
-- 		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
-- 		-- mappings = {
-- 		-- 	n = { ["q"] = require("telescope.actions").close },
-- 		-- },
-- 	},
--
-- 	-- extensions_list = { "terms",  },
-- 	extensions_list = {
-- 		fzf = {
-- 			fuzzy = true, -- false will only do exact matching
-- 			override_generic_sorter = true, -- override the generic sorter
-- 			override_file_sorter = true, -- override the file sorter
-- 			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
-- 		},
-- 	},
-- }

-- local builtin = require("telescope.builtin")
-- local themes = require("telescope.themes")

M.init = function()
	vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Find keymaps" })
	vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
	vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Find word" })
	vim.keymap.set("n", "<leader>fe", "<cmd>Telescope grep_string<CR>", { desc = "Find exact word" })
	vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find oldfiles" })
	vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
	vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Find within git status" })
	vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Find symbols" })
	vim.keymap.set("n", "/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find withi current buffer" })
	-- vim.keymap.set("n", "<leader>fs", "<cmd>Telescope treesitter<CR>")
end

M.config = function(opts)
	require("telescope").setup(opts)
	-- for _, ext in ipairs(opts.extensions) do
	-- 	telescope.load_extension(ext)
	-- end
end

return M

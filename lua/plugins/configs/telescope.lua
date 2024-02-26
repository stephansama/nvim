local M = {}

local telescope = require("telescope")
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local async = require("plenary.async")
-- local telescope = require("telescope.builtin")

M.opts = {
	defaults = {
		mappings = {
			-- i = { ["<C-t>"] = trouble.open_with_trouble },
			-- n = { ["<C-t>"] = trouble.open_with_trouble },
		},
		prompt_prefix = "   ",
		initial_mode = "normal",
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

M.init = function()
	-- FIX: find_files not working
	vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
	vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>")
	vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
	vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
	vim.keymap.set("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
	vim.keymap.set("n", "<leader>ts", "<cmd>Telescope treesitter<CR>")
	vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>")
end

M.config = function(opts)
	telescope.setup(opts)
	-- for _, ext in ipairs(opts.extensions_list) do
	-- 	telescope.load_extension(ext)
	-- end
end

return M

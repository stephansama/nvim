local expand_keymaps = require("utils").expand_keymaps

local function picker_config(theme, initial_mode)
	return { theme = theme, initial_mode = initial_mode }
end

local insert_picker = picker_config("dropdown", "insert")
local normal_picker = picker_config("dropdown", "normal")

local telescope_config = {
	defaults = { prompt_prefix = "   ", initial_mode = "insert" },
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
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			expand_keymaps({
				n = {
					["<leader><Tab>"] = { "<cmd>Telescope buffers<CR>", "Find buffers" },
					["<leader>fls"] = { "<cmd>Telescope lsp_document_symbols<CR>", "Find symbols" },
					["<leader>fk"] = { "<cmd>Telescope keymaps<CR>", "Find keymaps" },
					["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
					["<leader>fw"] = { "<cmd>Telescope live_grep<CR>", "Find word" },
					["<leader>fe"] = { "<cmd>Telescope grep_string<CR>", "Find exact word" },
					["<leader>fo"] = { "<cmd>Telescope oldfiles<CR>", "Find oldfiles" },
					["<leader>ft"] = { "<cmd>Telescope colorscheme<CR>", "Change colorscheme" },
					["<leader>fm"] = { "<cmd>Telescope marks<CR>", "Find marks" },
					["<leader>gs"] = { "<cmd>Telescope git_status<CR>", "Find within git status" },
					["<leader>fs"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find within current buffer" },
				},
			})
		end,
		config = function()
			local telescope = require("telescope")
			telescope.setup(telescope_config)
			telescope.load_extension("fzf")
		end,
	},
}

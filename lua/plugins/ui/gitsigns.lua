local opts = function()
	return {
		-- on_attach = require("keys.").load_gitsigns_keymap,
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		auto_attach = true,
		watch_gitdir = { follow_files = true },
		sign_priority = 6,
		update_debounce = 100,
		max_file_length = 40000, -- Disable if file is longer than this (in lines)
		status_formatter = nil, -- Use default
		attach_to_untracked = false,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		current_line_blame_opts = {
			delay = 1000,
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			ignore_whitespace = false,
			virt_text_priority = 100,
		},
		preview_config = {
			--- Options passed to nvim_open_win
			row = 0,
			col = 1,
			style = "minimal",
			border = "single",
			relative = "cursor",
		},
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "󰍵" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "│" },
		},
	}
end

return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = true,
	opts = opts,
	keys = require("keys.plugin").gitsigns,
}

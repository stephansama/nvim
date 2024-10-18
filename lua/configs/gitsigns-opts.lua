local expand_keymaps = require("utils.expand").expand_keymaps

local on_attach = function(bufnr)
	local gs = package.loaded.gitsigns
	local opts = { buffer = bufnr }

	local visual_git_action = function(action)
		return function()
			gs[action]({ vim.fn.line("."), vim.fn.line("v") })
		end
	end

	local hunk_direction = function(direction)
		return function()
			if vim.wo.diff then
				return direction == "prev" and "[h" or "]h"
			end
			vim.schedule(function()
				if direction == "prev" then
					gs.prev_hunk()
				else
					gs.next_hunk()
				end
			end)
			return "<Ignore>"
		end
	end

	expand_keymaps({
		[{ "o", "x" }] = {
			["ih"] = { ":<C-U>Gitsigns select_hunk<CR>", "", opts },
		},
		v = {
			["<leader>hs"] = { visual_git_action("stage_hunk"), "Stage hunk", opts },
			["<leader>gr"] = { visual_git_action("reset_hunk"), "Reset hunk", opts },
		},
		n = {
			["[h"] = { hunk_direction("prev"), "Prev hunk", opts },
			["]h"] = { hunk_direction("next"), "Next hunk", opts },
			["<leader>gp"] = { gs.preview_hunk, "Preview hunk", opts },
			["<leader>gR"] = { gs.reset_buffer, "Reset buffer", opts },
			["<leader>gr"] = { gs.reset_hunk, "Reset hunk", opts },
			["<leader>tb"] = { gs.toggle_current_line_blame, "Toggle current line blame", opts },
			["<leader>td"] = { gs.toggle_deleted, "Toggle deleted", opts },
			["<leader>hd"] = { gs.diffthis, "Diff this", opts },
			["<leader>hs"] = { gs.stage_hunk, "Stage hunk", opts },
			["<leader>hS"] = { gs.stage_buffer, "Stage buffer", opts },
			["<leader>hu"] = { gs.undo_stage_hunk, "Undo stage hunk", opts },
			["<leader>hb"] = {
				function()
					gs.blame_line({ full = true })
				end,
				"Stage buffer",
				opts,
			},
			["<leader>hD"] = {
				function()
					gs.diffthis("~")
				end,
				"Diff this",
				opts,
			},
		},
	})
end

return {
	on_attach = on_attach,
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	auto_attach = true,
	watch_gitdir = { follow_files = true },
	attach_to_untracked = false,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	status_formatter = nil, -- Use default
	current_line_blame_opts = {
		delay = 1000,
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
	preview_config = { --- Options passed to nvim_open_win
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

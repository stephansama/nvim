local M = {}

M.load_gitsigns_keymap = function(buffer)
	local gs = package.loaded.gitsigns
	local expand_keymaps = require("utils.expand").expand_keymaps
	local NEXT_KEYBINDING = "]h"
	local PREVIOUS_KEYBINDING = "[h"

	local blame_popup = function()
		gs.blame_line({ full = true })
	end

	local git_diff_root = function()
		gs.diffthis("~")
	end

	local visual_git_action = function(action)
		return function()
			gs[action]({ vim.fn.line("."), vim.fn.line("v") })
		end
	end

	local hunk_direction = function(direction)
		return function()
			if vim.wo.diff then
				return direction == "prev" and PREVIOUS_KEYBINDING or NEXT_KEYBINDING
			end
			local action = direction == "prev" and "prev_hunk" or "next_hunk"
			vim.schedule(function()
				gs[action]()
			end)
			return "<Ignore>"
		end
	end

	expand_keymaps({
		[{ "o", "x" }] = {
			["ih"] = { ":<C-U>Gitsigns select_hunk<CR>", "" },
		},
		v = {
			["<leader>hs"] = { visual_git_action("stage_hunk"), "Git Stage hunk" },
			["<leader>gr"] = { visual_git_action("reset_hunk"), "Git Reset hunk" },
		},
		n = {
			["<leader>gp"] = { gs.preview_hunk, "Git Preview hunk" },
			["<leader>gR"] = { gs.reset_buffer, "Git Reset buffer" },
			["<leader>gr"] = { gs.reset_hunk, "Git Reset hunk" },
			["<leader>tb"] = { gs.toggle_current_line_blame, "Git Toggle current line blame" },
			["<leader>td"] = { gs.toggle_deleted, "Git Toggle deleted" },
			["<leader>hd"] = { gs.diffthis, "Git Diff this" },
			["<leader>hs"] = { gs.stage_hunk, "Git Stage hunk" },
			["<leader>hS"] = { gs.stage_buffer, "Git Stage buffer" },
			["<leader>hu"] = { gs.undo_stage_hunk, "Git Undo stage hunk" },
			["<leader>hb"] = { blame_popup, "Stage buffer" },
			["<leader>hD"] = { git_diff_root, "Diff this" },
			[NEXT_KEYBINDING] = { hunk_direction("next"), "Git Next hunk" },
			[PREVIOUS_KEYBINDING] = { hunk_direction("prev"), "Git Prev hunk" },
		},
	}, { buffer = buffer })
end

return M

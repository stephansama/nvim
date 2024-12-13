local utils = require("utils")

require("utils.expand").expand_keymaps({
	[{ "v", "x" }] = { p = { '"_dP', "Paste without copying" } },
	n = {
		["<ESC>"] = { vim.cmd.noh, "Escape" },
		["<leader><leader>w"] = { vim.cmd.wqa, "Save and quit all" },
		["<leader><leader><leader>"] = { vim.cmd.qa, "Quit all" },

		--- leader functions
		["<leader>w"] = { vim.cmd.w, "Save buffer" },
		["<leader>x"] = { vim.cmd.q, "Close window" },
		["<leader>d"] = { utils.delete_buffer, "Delete buffer" },
		["<leader>ll"] = { vim.cmd.Lazy, "Load lazy plugin manager" },
		["<leader>lm"] = { vim.cmd.Mason, "Load mason plugin manager" },
		["<leader>lo"] = { ":Lazy load ", "Lazy load a plugin" },
		["<leader>la"] = { "<cmd>bufdo bd!<CR>", "Close all buffers" },
		["<leader>tp"] = { vim.cmd.tabprevious, "Go to previous tab" },
		["<leader>tx"] = { vim.cmd.tabnext, "Go to next tab" },
		["<leader>tn"] = { vim.cmd.tabnew, "Create new tab" },
		["<leader>vc"] = { "<cmd>!code .<CR>", "Open project in visual studio code" },

		--- splits
		["<leader>sh"] = { "<cmd>sp<CR>", "Split horizontally" },
		["<leader>sv"] = { "<cmd>vsp<CR>", "Split vertically" },

		--- quick line
		["o"] = { "o<ESC>zz" },
		["O"] = { "O<ESC>zz" },

		--- quick actions
		["cw"] = { "ciw", "Change word" },
		["c'"] = { "ci'", "Change single quotes" },
		['c"'] = { 'ci"', "Change double quotes" },
		["dw"] = { "diw", "Delete word" },
		["d'"] = { "di'", "Delete single quotes" },
		['d"'] = { 'di"', "Delete double quotes" },
		["yw"] = { "yiw", "Yank word" },
		["y'"] = { "yi'", "Yank single quotes" },
		['y"'] = { 'yi"', "Yank double quotes" },
		["vw"] = { "viw", "Visually select word" },
		["v'"] = { "vi'", "Visually select single quotes" },
		['v"'] = { 'vi"', "Visually select double quotes" },

		--- navigate buffers
		[")"] = { utils.move_buffer("next"), "Navigate to next buffer" },
		["("] = { utils.move_buffer("previous"), "Navigate to previous buffer" },
	},
	v = {
		["<"] = { "<gv", "Indent Left" },
		[">"] = { ">gv", "Indent Left" },
		["J"] = { ":m '>+1<CR>gv=gvzz", "Move line up", { silent = true } },
		["K"] = { ":m '<-2<CR>gv=gvzz", "Move line down", { silent = true } },
	},
	[{ "n", "v" }] = {
		["k"] = { "gkzz" },
		["j"] = { "gjzz" },
		["{"] = { "{zz" },
		["%"] = { "%zz" },
		["}"] = { "}z" },
		["u"] = { "uzz" },
		["G"] = { "Gzz" },
		["``"] = { "``zz" },
		["<C-R>"] = { "<C-R>zz" },
		["<C-D>"] = { "<C-D>zz" },
		["<C-U>"] = { "<C-U>zz" },
	},
	[{ "n", "o", "v", "x" }] = {
		["H"] = { "^", "Move to beginning of line" },
		["L"] = { "$", "Move to end of line" },
	},
})

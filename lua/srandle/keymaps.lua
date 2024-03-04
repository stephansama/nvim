local expand_keymaps = require("utils").expand_keymaps

expand_keymaps({
	n = {
		["<ESC>"] = { vim.cmd.noh, "Escape" },
		["Q"] = { "@q", "Replay quick macro" },

		-- leader functions
		["<leader>w"] = { vim.cmd.w, "Save buffer" },
		["<leader>x"] = { vim.cmd.q, "Close window" },
		["<leader>d"] = { vim.cmd.bd, "Delete buffer" },
		["<leader>ll"] = { vim.cmd.Lazy, "Load lazy plugin manager" },
		["<leader>lm"] = { vim.cmd.Mason, "Load mason plugin manager" },

		-- quick actions
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

		-- centered motions
		["%"] = { "%zz" },
		["{"] = { "{zz" },
		["}"] = { "}zz" },
		["j"] = { "gjzz" },
		["k"] = { "gkzz" },
		["gg"] = { "ggzz" },
		["G"] = { "Gzz" },
		["o"] = { "o<ESC>zz" },
		["O"] = { "O<ESC>zz" },
		["u"] = { "uzz" },
		["<C-r>"] = { "<C-r>zz" },
		["<C-d>"] = { "<C-d>zz" },
		["<C-u>"] = { "<C-u>zz" },

		-- navigate windows
		["<C-h>"] = { "<C-w>h", "Navigate window left" },
		["<C-l>"] = { "<C-w>l", "Navigate window left" },
		["<C-]>"] = { "<C-w>>", "Increase window size" },

		-- navigate buffers
		["("] = {
			function()
				vim.cmd.bprevious()
				print("Previous Buffer")
			end,
			"Navigate to previous buffer",
		},
		[")"] = {
			function()
				vim.cmd.bnext()
				print("Next Buffer")
			end,
			"Navigate to previous buffer",
		},
	},
	v = {
		["<"] = { "<gv", "Indent Left" },
		[">"] = { ">gv", "Indent Left" },
		["J"] = { ":m '>+1<CR>gv=gv", "Move line up" },
		["K"] = { ":m '<-2<CR>gv=gv", "Move line down" },
	},
	[{ "n", "o" }] = {
		["H"] = { "^zz", "Move to beginning of line" },
		["L"] = { "$zz", "Move to end of line" },
	},
})

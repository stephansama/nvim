local utils = require("utils")

require("utils.expand").expand_keymaps({
	[{ "v", "x" }] = { p = { '"_dP', "Paste without copying" } },
	n = {
		["<ESC>"] = { vim.cmd.noh, "Escape" },
		["<leader><leader>w"] = { vim.cmd.wqa, "Save and quit all" },
		["<leader><leader><leader>"] = { vim.cmd.qa, "Quit all" },

		--- FZF keymaps
		["<leader>gsm"] = {
			utils.cd_fzf_keymap(
				"git submodule foreach '' | sed 's/Entering //g' | " .. 'tr -d "\'"' .. " | fzf",
				vim.fn.getcwd()
			),
			"Switch to git submodule",
		},
		["<leader>fp"] = {
			utils.cd_fzf_keymap(
				'find "$CODE" -type d -mindepth 1 -maxdepth 1 | sed "s@$CODE/@@g" | fzf --ansi',
				os.getenv("CODE") .. ""
			),
			"Switch to project",
		},

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
		["<leader>se"] = { "<cmd>!open .<CR>", "Open project in finder" },
		["<leader>sf"] = { "<cmd>!open '%:p'<CR>", "Open file with default provider" },
		["<leader>vc"] = { "<cmd>!code .<CR>", "Open project in visual studio code" },
		["<leader>vf"] = { "<cmd>!code '%:p'<CR>", "Open file in visual studio code" },

		--- quick line
		["o"] = { "o<ESC>zz" },
		["O"] = { "O<ESC>zz" },

		["Q'"] = { "@q", "Quick replay" },
	},
	x = {
		["/"] = { "<Esc>/\\%V", "Search within lines" },
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

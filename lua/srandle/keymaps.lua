local expand_keymaps = require("utils").expand_keymaps

---move buffer in a specific direction
---@param direction 'next' | 'previous'
---@return function
local function move_buffer(direction)
	local directions = { previous = vim.cmd.bprevious, next = vim.cmd.bnext }
	return function()
		directions[direction]()
		print(direction:gsub("^%l", string.upper) .. " Buffer")
	end
end

--- Deletes buffer and alerts the user
local function delete_buffer()
	vim.cmd.bd()
	print("Deleting buffer...")
end

expand_keymaps({
	[{ "v", "x" }] = { p = { '"_dP', "Paste without copying" } },
	n = {
		["<ESC>"] = { vim.cmd.noh, "Escape" },
		["<leader><leader>w"] = { vim.cmd.wqa, "Save and quit all" },
		["<leader><leader><leader>"] = { vim.cmd.qa, "Quit all" },

		["<leader>md"] = {
			function()
				vim.cmd([[delmarks!]])
				vim.cmd([[delmarks A-Z0-9]])
			end,
			"Escape",
		},

		-- macro
		["Q"] = { "@q", "Replay quick macro" },

		-- leader functions
		["<leader>w"] = { vim.cmd.w, "Save buffer" },
		["<leader>x"] = { vim.cmd.q, "Close window" },
		["<leader>d"] = { delete_buffer, "Delete buffer" },
		["<leader>ll"] = { vim.cmd.Lazy, "Load lazy plugin manager" },
		["<leader>lm"] = { vim.cmd.Mason, "Load mason plugin manager" },
		["<leader>lo"] = { ":%bd|e#<CR>", "Close all except for current buffer" },
		["<leader>la"] = { ":bufdo bd!<CR>", "Close all buffers" },

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

		-- navigate windows
		["<C-k>"] = { "<C-w>k", "Navigate window up" },
		["<C-j>"] = { "<C-w>j", "Navigate window down" },
		["<C-h>"] = { "<C-w>h", "Navigate window left" },
		["<C-l>"] = { "<C-w>l", "Navigate window right" },
		["<C-]>"] = { "<C-w>>", "Increase window size" },

		-- navigate buffers
		["("] = { move_buffer("previous"), "Navigate to previous buffer" },
		[")"] = { move_buffer("next"), "Navigate to next buffer" },
	},
	v = {
		["<"] = { "<gv", "Indent Left" },
		[">"] = { ">gv", "Indent Left" },
		["J"] = { ":m '>+1<CR>gv=gv", "Move line up" },
		["K"] = { ":m '<-2<CR>gv=gv", "Move line down" },
	},
	-- centered motions
	[{ "n", "v", "x" }] = {
		["j"] = { "gjzz" },
		["k"] = { "gkzz" },
		["%"] = { "%zz" },
		["{"] = { "{zz" },
		["}"] = { "}zz" },
	},
	[{ "n", "o", "v", "x" }] = {
		["gg"] = { "ggzz" },
		["G"] = { "Gzz" },
		["o"] = { "o<ESC>zz" },
		["O"] = { "O<ESC>zz" },
		["u"] = { "uzz" },
		["<C-r>"] = { "<C-r>zz" },
		["<C-d>"] = { "<C-d>zz" },
		["<C-u>"] = { "<C-u>zz" },
		["``"] = { "``zz" },
		["H"] = { "^zz", "Move to beginning of line" },
		["L"] = { "$zz", "Move to end of line" },
	},
})

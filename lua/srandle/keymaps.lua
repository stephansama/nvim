vim.g.mapleader = " "

-- Visual
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Normal
---- replay macro
vim.keymap.set("n", "Q", "@q")

---- window positioning
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

---- quick actions
vim.keymap.set("n", "cw", "ciw")
vim.keymap.set("n", "c'", "ci'")
vim.keymap.set("n", 'c"', 'ci"')
vim.keymap.set("n", "dw", "diw")
vim.keymap.set("n", "d'", "di'")
vim.keymap.set("n", 'd"', 'di"')
vim.keymap.set("n", "yw", "yiw")
vim.keymap.set("n", "y'", "yi'")
vim.keymap.set("n", 'y"', 'yi"')
vim.keymap.set("n", "vw", "viw")
vim.keymap.set("n", "v'", "vi'")
vim.keymap.set("n", 'v"', 'vi"')

---- centered motions
vim.keymap.set("n", "%", "%zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set({ "n", "o" }, "H", "^zz")
vim.keymap.set({ "n", "o" }, "L", "$zz")
vim.keymap.set("n", "j", "gjzz")
vim.keymap.set("n", "k", "gkzz")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "ggzz")
vim.keymap.set("n", "u", "uzz")
vim.keymap.set("n", "<C-r>", "<C-r>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "o", "o<ESC>zz")
vim.keymap.set("n", "O", "O<ESC>zz")

-- leader functions
vim.keymap.set("n", "<ESC>", vim.cmd.noh)
vim.keymap.set("n", "<leader>x", vim.cmd.q)
vim.keymap.set("n", "<leader>d", vim.cmd.bd)
vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Save file" })

-- netrw fallback
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ll", vim.cmd.Lazy, { desc = "Open :Lazy" })
vim.keymap.set("n", "<leader>lm", vim.cmd.Mason, { desc = "Open :Mason" })

-- go to link
vim.keymap.set("n", "gl", function()
	local uri = vim.fn.matchstr(vim.fn.getline("."), "[a-z]*:\\/\\/[^ >,;]*")
	print(uri)
	if uri ~= "" then
		vim.fn.system("open '" .. uri .. "'")
	else
		print("No URI found in line.")
	end
end)

-- TODO: enable when lsp inlay hints are available nvim 0.10.0>
-- vim.keymap.set("n", "<leader>ti", function()
-- 	vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
-- end)

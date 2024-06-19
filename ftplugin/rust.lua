local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>oc", function()
	vim.cmd.RustLsp("openCargo")
end, { silent = true, buffer = bufnr })

vim.keymap.set("n", "<leader>od", function()
	vim.cmd.RustLsp("openDocs")
end, { silent = true, buffer = bufnr })

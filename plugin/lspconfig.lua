vim.schedule(function()
	vim.pack.add({ { src = "https://github.com/neovim/nvim-lspconfig" } })

	require("utils.lspconfig")
end)

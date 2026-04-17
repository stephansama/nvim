vim.pack.add({
	{ src = "https://github.com/kevinhwang91/nvim-bqf" },
	{ src = "https://github.com/stevearc/quicker.nvim" },
})

require("bqf").setup()
require("quicker").setup()

vim.pack.add({
	{ src = "https://github.com/stephansama/fzf-nerdfont.nvim" },
	{ src = "https://github.com/stephansama/fzf-tmux-runner.nvim" },
})

require("fzf-nerdfont").setup()
require("fzf-tmux-runner").setup({
	package_manager = "nr",
	direction = "horizontal",
	interactive = true,
})

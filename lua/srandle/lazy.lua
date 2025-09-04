local LAZY_DIR = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.opt.rtp:prepend(LAZY_DIR)
if not vim.loop.fs_stat(LAZY_DIR) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		LAZY_DIR,
	})
end

require("lazy").setup(require("plugins.lang").PLUGINS, {
	defaults = { lazy = true },
	install = {
		colorscheme = { "catpuccin" },
	},
	ui = { border = "rounded" },
	{ icons = require("icons").lazy },
})

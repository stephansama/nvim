local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local plugins = require("utils").plugins
local icons = require("configs.icons").lazy

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
	plugins({
		"ui",
		"lang",
		"editor",
		"debug",
		"test",
	}),
	{
		defaults = { lazy = true },
		install = { colorscheme = { "catpuccin" } },
		ui = { border = "rounded" },
		{ icons = icons },
	}
)

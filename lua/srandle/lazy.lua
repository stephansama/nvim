local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local plugins = require("utils").plugins

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

require("lazy").setup(plugins({ "ui", "lang", "editor" }), {
	defaults = { lazy = true },
	install = { colorscheme = { "catpuccin" } },
	ui = { border = "rounded" },
	{ icons = { ft = "", lazy = "󰂠 ", loaded = "", not_loaded = "" } },
})

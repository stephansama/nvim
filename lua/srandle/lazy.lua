local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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

local plugins = {
	{ import = "plugins" },
	{ import = "plugins.ui" },
	{ import = "plugins.lang" },
	{ import = "plugins.editor" },
}

require("lazy").setup(plugins, {
	install = { colorscheme = { "catpuccin" } },
	defaults = { lazy = true },
	ui = { border = "rounded" },
	{
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},
})

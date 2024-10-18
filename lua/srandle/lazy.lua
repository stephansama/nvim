local ENABLED_PLUGINS = require("constants.plugins")
local LAZY_DIR = require("constants.dir").LAZY_DIR
local plugins = require("utils.expand").expand_plugins
local icons = require("configs.icons").lazy

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

local lazy_options = {
	defaults = { lazy = true },
	install = { colorscheme = { "catpuccin" } },
	ui = { border = "rounded" },
	{ icons = icons },
}

require("lazy").setup(plugins(ENABLED_PLUGINS), lazy_options)

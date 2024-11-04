local expand_plugins = require("utils.expand").expand_plugins
local ENABLED_PLUGINS = require("constants.pulled").PLUGINS
local LAZY_DIR = require("constants.dir").LAZY_DIR
local LAZY_URL = require("constants.url").LAZY_URL
local icons = require("configs.icons").lazy

vim.opt.rtp:prepend(LAZY_DIR)
if not vim.loop.fs_stat(LAZY_DIR) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		LAZY_URL,
		"--branch=stable", -- latest stable release
		LAZY_DIR,
	})
end

require("lazy").setup(expand_plugins(ENABLED_PLUGINS), {
	defaults = { lazy = true },
	install = { colorscheme = { "catpuccin" } },
	ui = { border = "rounded" },
	{ icons = icons },
})

local keys = require("keys.init")
local configure_telescope = require("utils").configure_telescope

return {
	{ "camgraff/telescope-tmux.nvim", keys = keys.telescope_tmux },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = false },
	{
		"ziontee113/icon-picker.nvim",
		config = true,
		opts = { disable_legacy_commands = true },
		keys = keys.telescope_icon_picker,
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = configure_telescope(require("constants.pulled").TELESCOPE_EXTENSIONS),
		lazy = false,
		keys = keys.telescope,
		opts = function()
			return require("configs.telescope-opts")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			{ "isak102/telescope-git-file-history.nvim", dependencies = { "tpope/vim-fugitive" } },
		},
	},
}

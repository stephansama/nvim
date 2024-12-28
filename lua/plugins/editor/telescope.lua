local keys = require("keys.init")
local configure_telescope = require("utils").configure_telescope
local opts = function()
	return require("configs.telescope-opts")
end

return {
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
		keys = keys.telescope,
		opts = opts,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			{ "isak102/telescope-git-file-history.nvim", dependencies = { "tpope/vim-fugitive" } },
		},
	},
}

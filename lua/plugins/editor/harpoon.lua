return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = require("keys.init").harpoon,
	branch = "harpoon2",
	config = function(_, opts)
		require("harpoon"):setup(opts)
	end,
}

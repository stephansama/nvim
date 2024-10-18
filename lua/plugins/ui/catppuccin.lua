return {
	"catppuccin/nvim",
	priority = 1000,
	name = "catppuccin",
	lazy = false,
	opts = function()
		return require("configs.catppuccin")
	end,
}

vim.pack.add({ { src = "https://github.com/rachartier/tiny-cmdline.nvim" } })

require("tiny-cmdline").setup({
	position = {
		x = "50%", -- horizontal: "0%" = left, "50%" = center, "100%" = right
		y = "25%", -- vertical:   "0%" = top,  "50%" = center, "100%" = bottom
	},
	border = nil,
	-- Cmdline types rendered at the bottom of the screen instead of centered
	-- "/" and "?" (search) are kept native by default
	native_types = {},
})

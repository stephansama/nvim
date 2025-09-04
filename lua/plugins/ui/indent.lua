local ft = require("constants")

local exclude = {
	buftypes = ft.INDENT_EXCLUDE_BUFTYPES,
	filetypes = ft.INDENT_EXCLUDE_FILETYPES,
}

return { {
	"lukas-reineke/indent-blankline.nvim",
	config = true,
	event = "User FilePost",
	main = "ibl",
	lazy = false,
	opts = {
		scope = { enabled = false },
		exclude = exclude,
	},
}, {
	"echasnovski/mini.indentscope",
	ft = "*",
	opts = {
		symbol = require("icons").indent_blankline,
		options = { try_as_border = true },
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = ft.INDENT_EXCLUDE_FILETYPES,
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
} }

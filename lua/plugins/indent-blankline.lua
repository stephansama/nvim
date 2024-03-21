local exclude_filetypes = {
	"alpha",
	"neo-tree",
	"Trouble",
	"trouble",
	"lazy",
	"mason",
	"notify",
	"toggleterm",
	"lazyterm",
	"lspinfo",
	"packer",
	"checkhealth",
	"help",
	"man",
	"gitcommit",
	"TelescopePrompt",
	"TelescopeResults",
	"dashboard",
}

local ibl_config = {
	-- use to switch back to every line being colored
	-- indent = { highlight = highlight },
	scope = { enabled = false },
	exclude = {
		buftypes = { "terminal", "nofile", "quickfix", "prompt" },
		filetypes = exclude_filetypes,
	},
}

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User FilePost",
		main = "ibl",
		lazy = false,
		opts = ibl_config,
		config = true,
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		ft = "*",
		opts = { symbol = "│", options = { try_as_border = true } },
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = exclude_filetypes,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
}

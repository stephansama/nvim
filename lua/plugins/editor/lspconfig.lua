local keys = require("keys.plugin")

local statuscol_opts = function()
	local builtin = require("statuscol.builtin")
	return {
		relculright = true,
		segments = { {
			text = { builtin.foldfunc },
			click = "v:lua.ScFa",
		}, {
			text = { "%s" },
			click = "v:lua.ScSa",
		}, {
			text = { builtin.lnumfunc, " " },
			click = "v:lua.ScLa",
		} },
	}
end

local ufo_opts = {
	preview = {
		mappings = keys.ufo,
		win_config = {
			border = { "", "─", "", "", "", "─", "", "" },
			winhighlight = "Normal:Folded",
			winblend = 0,
		},
	},
}

return { {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = { enabled = true },
	},
	event = "BufEnter",
	config = function()
		require("utils.lspconfig")
		require("nvim-highlight-colors").turnOn()
		require("ufo").setup(ufo_opts)
	end,
	dependencies = { {
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async", {
			"luukvbaal/statuscol.nvim",
			opts = statuscol_opts,
			config = true,
		} },
	}, { "mason-org/mason.nvim" }, {
		"brenoprata10/nvim-highlight-colors",
		config = true,
		opts = {
			render = "background",
			enable_hex = true,
			enable_hsl = true,
			enable_rgb = true,
			enable_tailwind = true,
			enable_var_usage = true,
			enable_short_hex = true,
			enable_named_colors = true,
			virtual_symbol = "■",
			virtual_symbol_prefix = "",
			virtual_symbol_suffix = " ",
			virtual_symbol_position = "inline",
		},
	} },
}, {
	"MysticalDevil/inlay-hints.nvim",
	keys = keys.inlay_hints,
	event = "LspAttach",
	config = true,
	dependencies = { "neovim/nvim-lspconfig" },
} }

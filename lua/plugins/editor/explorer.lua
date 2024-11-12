local keys = require("keys.init")

local show_oil_detail = false

local oil_opts = {
	--- https://github.com/stevearc/oil.nvim?tab=readme-ov-file#options
	default_file_explorer = false,
	view_options = { show_hidden = true },
	keymaps = {
		["K"] = {
			desc = "Toggle file detail view",
			callback = function()
				local oil = require("oil")
				show_oil_detail = not show_oil_detail
				oil.set_columns(vim.tbl_deep_extend("force", { "icon" }, show_oil_detail and {
					"permissions",
					"size",
					"mtime",
				} or {}))
			end,
		},
	},
}

return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
		keys = keys.oil,
		opts = oil_opts,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		branch = "v3.x",
		config = true,
		keys = keys.neo_tree,
		opts = function()
			return require("configs.neo-tree-opts")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
	},
}

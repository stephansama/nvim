local keys = require("keys.init")

local window_picker_config = {
	filter_rules = {
		include_current_win = false,
		autoselect_one = true,
		-- filter using buffer options
		bo = {
			-- if the file type is one of following, the window will be ignored
			filetype = { "neo-tree", "neo-tree-popup", "notify" },
			-- if the buffer type is one of following, the window will be ignored
			buftype = { "terminal", "quickfix" },
		},
	},
}

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
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = true,
				opts = window_picker_config,
			},
		},
	},
}

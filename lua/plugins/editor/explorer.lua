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

local function execute_neotree(opts)
	return function()
		local reveal_file = vim.fn.expand("%:p")
		if reveal_file == "" then
			reveal_file = vim.fn.getcwd()
		else
			local f = io.open(reveal_file, "r")
			if f then
				f.close(f)
			else
				reveal_file = vim.fn.getcwd()
			end
		end
		require("neo-tree.command").execute(vim.tbl_deep_extend("force", {
			source = "filesystem",
			action = "focus",
			toggle = true,
			position = "right",
			reveal_file = reveal_file,
			reveal_force_cwd = true,
		}, opts or {}))
	end
end

local show_oil_detail = false

local oil_opts = {
	--- https://github.com/stevearc/oil.nvim?tab=readme-ov-file#options
	default_file_explorer = false,
	view_options = { show_hidden = true },
	keymaps = {
		["gd"] = {
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
		keys = { { "-", "<cmd>Oil<CR>", desc = "Open Oil.nvim" } },
		opts = oil_opts,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		opts = function()
			return require("configs.neo-tree-opts")
		end,
		branch = "v3.x",
		config = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				opts = window_picker_config,
				config = true,
			},
		},
		keys = {
			{ "\\", execute_neotree(), desc = "Open explorer side panel" },
			{ "g\\", execute_neotree({ source = "git_status" }), desc = "Open explorer side panel" },
		},
	},
}

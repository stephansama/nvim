local expand_keymaps = require("utils").expand_keymaps

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
		require("neo-tree.command").execute(opts)
		vim.wo.number = true
		vim.wo.relativenumber = true
	end
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup(window_picker_config)
			end,
		},
	},
	init = function()
		expand_keymaps({
			n = {
				["<leader>e"] = {
					execute_neotree({ action = "focus", reveal_force_cwd = true, position = "current" }),
					"Open netrw style explorer",
				},
				["g\\"] = {
					execute_neotree({
						toggle = true,
						action = "focus",
						source = "git_status",
						position = "right",
						reveal_force_cwd = true,
					}),
					"Open git",
				},
				["\\"] = {
					execute_neotree({
						reveal = true,
						toggle = true,
						action = "focus",
						position = "right",
						reveal_force_cwd = true,
					}),
					"Open explorer side panel",
				},
			},
		})
	end,
	config = function()
		require("neo-tree").setup(require("configs.neo-tree-opts"))
	end,
}

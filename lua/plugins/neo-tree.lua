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
			opts = window_picker_config,
			config = true,
		},
	},
	init = function()
		expand_keymaps({
			n = {
				["<leader>e"] = { execute_neotree({ position = "current" }), "Open netrw style explorer" },
				["\\"] = { execute_neotree(), "Open explorer side panel" },
				["g\\"] = { execute_neotree({ source = "git_status" }), "Open git" },
			},
		})
	end,
	config = true,
	opts = function()
		return require("configs.neo-tree-opts")
	end,
}

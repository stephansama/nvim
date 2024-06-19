return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"nvim-neotest/nvim-nio",
	},
	config = true,
	opts = {
		layouts = {
			{
				-- You can change the order of elements in the sidebar
				elements = {
					-- Provide IDs as strings or tables with "id" and "size" keys
					{
						id = "scopes",
						size = 0.25, -- Can be float or integer > 1
					},
					{ id = "breakpoints", size = 0.25 },
					{ id = "stacks", size = 0.25 },
					{ id = "watches", size = 0.25 },
				},
				size = 40,
				position = "right", -- Can be "left" or "right"
			},
			{
				elements = {
					"repl",
					"console",
				},
				size = 10,
				position = "bottom", -- Can be "bottom" or "top"
			},
		},
	},
}

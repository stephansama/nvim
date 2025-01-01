---@type snacks.Config
local opts = {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	bigfile = { enabled = true },
	profiler = { enabled = true },
	dashboard = {
		enabled = true,
		sections = {
			{ section = "startup" },
			{ section = "recent_files" },
			{
				key = "b",
				desc = "Browse Repo",
				icon = " ",
				action = function()
					Snacks.gitbrowse()
				end,
			},
			{ section = "keys" },
			{ section = "terminal", cmd = "gh graph" },
			function()
				local in_git = Snacks.git.get_root() ~= nil
				local cmds = {
					{
						title = "Open Issues",
						cmd = "gh issue list -L 3",
						key = "i",
						action = function()
							vim.fn.jobstart("gh issue list --web", { detach = true })
						end,
						icon = " ",
						-- height = 7,
					},
					{
						icon = " ",
						title = "Open PRs",
						cmd = "gh pr list -L 3",
						key = "p",
						action = function()
							vim.fn.jobstart("gh pr list --web", { detach = true })
						end,
						-- height = 7,
					},
					{
						icon = " ",
						title = "Git Status",
						cmd = "git --no-pager diff --stat -B -M -C",
						height = 10,
					},
				}
				return vim.tbl_map(function(cmd)
					return vim.tbl_extend("force", {
						pane = 2,
						section = "terminal",
						enabled = in_git,
						padding = 1,
						ttl = 5 * 60,
						indent = 3,
					}, cmd)
				end, cmds)
			end,
		},
	},
	gitbrowse = { enabled = true },
	zen = { enabled = true },
	input = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	statuscolumn = { enabled = true },
	---@class snacks.indent.Config
	---@field enabled? boolean
	indent = {
		indent = {
			priority = 1,
			enabled = true, -- enable indent guides
			char = "│",
			only_scope = false, -- only show indent guides of the scope
			only_current = false, -- only show indent guides in the current window
			hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
			-- can be a list of hl groups to cycle through
			-- hl = {
			--     "SnacksIndent1",
			--     "SnacksIndent2",
			--     "SnacksIndent3",
			--     "SnacksIndent4",
			--     "SnacksIndent5",
			--     "SnacksIndent6",
			--     "SnacksIndent7",
			--     "SnacksIndent8",
			-- },
		},
		-- animate scopes. Enabled by default for Neovim >= 0.10
		-- Works on older versions but has to trigger redraws during animation.
		---@class snacks.indent.animate: snacks.animate.Config
		---@field enabled? boolean
		--- * out: animate outwards from the cursor
		--- * up: animate upwards from the cursor
		--- * down: animate downwards from the cursor
		--- * up_down: animate up or down based on the cursor position
		---@field style? "out"|"up_down"|"down"|"up"
		animate = {
			enabled = vim.fn.has("nvim-0.10") == 1,
			style = "out",
			easing = "linear",
			duration = {
				step = 20, -- ms per step
				total = 500, -- maximum duration
			},
		},
		---@class snacks.indent.Scope.Config: snacks.scope.Config
		scope = {
			enabled = true, -- enable highlighting the current scope
			priority = 200,
			char = "│",
			underline = false, -- underline the start of the scope
			only_current = false, -- only show scope in the current window
			hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
		},
		chunk = {
			-- when enabled, scopes will be rendered as chunks, except for the
			-- top-level scope which will be rendered as a scope.
			enabled = false,
			-- only show chunk scopes in the current window
			only_current = false,
			priority = 200,
			hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
			char = {
				corner_top = "┌",
				corner_bottom = "└",
				-- corner_top = "╭",
				-- corner_bottom = "╰",
				horizontal = "─",
				vertical = "│",
				arrow = ">",
			},
		},
		blank = {
			char = " ",
			-- char = "·",
			hl = "SnacksIndentBlank", ---@type string|string[] hl group for blank spaces
		},
		-- filter for buffers to enable indent guides
		filter = function(buf)
			return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
		end,
	},
}

local keys = {
	{
		"<leader>z",
		function()
			Snacks.zen()
		end,
		desc = "Toggle Zen Mode",
	},
	{
		"<leader>ld",
		function()
			Snacks.dashboard()
		end,
		desc = "Go to dashboard",
	},
	{
		"<leader>.",
		function()
			Snacks.scratch()
		end,
		desc = "Toggle Scratch Buffer",
	},
	{
		"<leader>S",
		function()
			Snacks.scratch.select()
		end,
		desc = "Select Scratch Buffer",
	},
	{
		"<leader>n",
		function()
			Snacks.notifier.show_history()
		end,
		desc = "Notification History",
	},
	{
		"<leader>bd",
		function()
			Snacks.bufdelete()
		end,
		desc = "Delete Buffer",
	},
	{
		"<leader>cR",
		function()
			Snacks.rename.rename_file()
		end,
		desc = "Rename File",
	},
	{
		"<leader>gB",
		function()
			Snacks.gitbrowse()
		end,
		desc = "Git Browse",
		mode = { "n", "v" },
	},
	{
		"<leader>gb",
		function()
			Snacks.git.blame_line()
		end,
		desc = "Git Blame Line",
	},
	{
		"<leader>gf",
		function()
			Snacks.lazygit.log_file()
		end,
		desc = "Lazygit Current File History",
	},
	{
		"<leader>gg",
		function()
			Snacks.lazygit()
		end,
		desc = "Lazygit",
	},
	{
		"<leader>gl",
		function()
			Snacks.lazygit.log()
		end,
		desc = "Lazygit Log (cwd)",
	},
	{
		"<leader>un",
		function()
			Snacks.notifier.hide()
		end,
		desc = "Dismiss All Notifications",
	},
	{
		"]]",
		function()
			Snacks.words.jump(vim.v.count1)
		end,
		desc = "Next Reference",
		mode = { "n", "t" },
	},
	{
		"[[",
		function()
			Snacks.words.jump(-vim.v.count1)
		end,
		desc = "Prev Reference",
		mode = { "n", "t" },
	},
	{
		"<leader>N",
		desc = "Neovim News",
		function()
			Snacks.win({
				file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
				width = 0.8,
				height = 0.8,
				wo = {
					spell = false,
					wrap = false,
					signcolumn = "yes",
					statuscolumn = " ",
					conceallevel = 3,
				},
			})
		end,
	},
}

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = opts,
	keys = keys,
}

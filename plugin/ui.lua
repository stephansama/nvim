local theme = require("config.constants")

vim.pack.add({ { src = "https://github.com/nvim-lualine/lualine.nvim" }, {
	src = "https://github.com/catppuccin/nvim",
	name = "catppuccin",
}, {
	src = "https://github.com/onaforeignshore/PackMan.nvim",
}, {
	src = "https://github.com/f-person/auto-dark-mode.nvim",
}, {
	src = "https://github.com/nvimdev/dashboard-nvim",
}, {
	src = "https://github.com/szw/vim-maximizer",
}, {
	src = "https://github.com/chentoast/marks.nvim",
}, { src = "https://github.com/mcauley-penney/visual-whitespace.nvim" } })

--- https://github.com/catppuccin/nvim?tab=readme-ov-file#configuration

--- create nvim-lspconfig catppuccin options
---@param type string
---@return table
local function create_theme_options(type)
	return {
		hints = { type },
		errors = { type },
		warnings = { type },
		information = { type },
	}
end

require("catppuccin").setup({
	float = {
		transparent = true,
		solid = false,
	},
	flavour = "mocha",
	show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
	transparent_background = true,
	integrations = {
		dap = true,
		fzf = true,
		ufo = true,
		mason = true,
		noice = true,
		dap_ui = true,
		notify = true,
		neotest = true,
		neotree = true,
		gitsigns = true,
		grug_far = true,
		blink_cmp = true,
		dashboard = true,
		telescope = true,
		illuminate = true,
		treesitter = true,
		lsp_trouble = true,
		nvim_surround = true,
		window_picker = true,
		render_markdown = true,
		symbols_outline = true,
		indent_blankline = true,
		treesitter_context = true,
		mini = {
			notify = true,
			enabled = true,
			indent_blankline = true,
		},
		native_lsp = {
			enabled = true,
			underlines = create_theme_options("underline"),
			virtual_text = create_theme_options("italic"),
		},
	},
})

vim.cmd.colorscheme("catppuccin-nvim")

local function auto_theme(current_theme)
	local is_darkmode = current_theme == theme.THEME_DARKMODE
	return function()
		local next_theme = is_darkmode and "dark" or "light"
		vim.api.nvim_set_option_value("background", next_theme, {})

		vim.cmd(string.format("colorscheme %s", current_theme))

		if is_darkmode then
			vim.cmd([[hi BqfPreviewFloat guibg=#1e1e2e]])
			vim.cmd([[hi BqfPreviewTitle guibg=#1e1e2e]])
			vim.cmd([[hi BqfPreviewBorder guibg=#1e1e2e]])
			vim.cmd([[hi MiniNotifyBorder guibg=none ctermbg=none]])
			vim.cmd([[hi MiniNotifyNormal guibg=none ctermbg=none]])
			vim.cmd([[hi MiniNotifyTitle guibg=none ctermbg=none]])
		end

		vim.cmd([[ResetUI]])
	end
end

require("auto-dark-mode").setup({
	update_interval = 1000,
	set_dark_mode = auto_theme(theme.THEME_DARKMODE),
	set_light_mode = auto_theme(theme.THEME_LIGHTMODE),
})

local blank_separators = {
	left = "",
	right = "",
}

require("marks").setup({})
require("visual-whitespace").setup()
require("plugman").setup()

require("lualine").setup({
	options = {
		theme = require("config.constants").THEME,
		globalstatus = true,
		disabled_filetypes = { "dashboard" },
		section_separators = blank_separators,
		component_separators = blank_separators,
	},
	sections = {
		lualine_c = { {
			"filename",
			file_status = true,
			newfile_status = true,
			path = 3,
			symbols = require("icons").lualine,
		}, { function()
			return require("package-info").get_status()
		end } },
		lualine_x = { function()
			return require("NeoComposer.ui").status_recording()
		end, "fileformat", "filetype" },
	},
})

local constants = require("config.constants")

vim.api.nvim_create_user_command(
	"ColorDashboard",
	function()
		math.randomseed(os.time())
		local COLORS =
			vim.g.colors_name == constants.THEME_DARKMODE and constants.DASHBOARD_DARKMODE or constants.DASHBOARD_LIGHTMODE
		local selected = COLORS[math.random(#COLORS)]
		vim.cmd("hi DashboardHeader guibg=none guifg=" .. selected)
	end,
	{ nargs = 0 }
)

vim.api.nvim_create_user_command(
	"GoToDashboard",
	function()
		vim.cmd([[ColorDashboard]])
		vim.cmd([[bufdo bd!]])
		vim.cmd([[Dashboard]])
	end,
	{ nargs = 0 }
)

_G.loaded_time = vim.loop.hrtime()

require("dashboard").setup({
	theme = "hyper",
	change_to_vcs_root = true,
	shortcut_type = "number",
	disable_move = true,
	config = {
		shortcut = require("utils.dashboard.shortcuts").shortcuts,
		header = require("utils.dashboard.ascii").loadAscii(),
		footer = function()
			local time = (_G.loaded_time - _G.start_time) / 1e6
			local ms = (math.floor(time * 100 + 0.5) / 100)
			return {
				" loaded " .. #vim.pack.get() .. " plugins in " .. ms .. "ms",
			}
		end,
		mru = {
			enable = true,
			limit = 9,
			icon = " ",
			label = "Files",
			cwd_only = true,
		},
		project = { enable = false },
		packages = { enable = false },
	},
})

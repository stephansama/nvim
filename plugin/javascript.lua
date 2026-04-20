if not vim.tbl_contains(
	require("lang.enabled").enabled,
	"javascript"
) then return end

vim.pack.add({
	{ src = "https://github.com/mistweaverco/kulala.nvim" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{ src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring" },
	{ src = "https://github.com/stephansama/package-info.nvim" },
	{ src = "https://github.com/barrett-ruth/live-server.nvim" },
})

require("kulala").setup({
	global_keymaps = true,
	global_keymaps_prefix = "<leader>R",
	kulala_keymaps_prefix = "",
})

require("nvim-ts-autotag").setup({})
require("ts_context_commentstring").setup({})
require("package-info").setup({
	package_manager = "pnpm",
	hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
	hide_unstable_versions = true,
	highlights = require("config.constants").PACKAGE_INFO_COLORS,
	icons = {
		enable = true,
		style = require("icons.init").packageJSON,
	},
})

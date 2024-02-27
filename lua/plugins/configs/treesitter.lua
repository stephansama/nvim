local M = {}

M.opts = {
	parser_install_dir = "$HOME/.local/share/treesitter",
	auto_install = false,
	sync_install = false,
	autotag = { enable = true },
	highlight = { enable = true },
	ensure_installed = {
		"c",
		"rust",
		"go",
		"gomod",
		"gosum",
		"lua",
		"css",
		"html",
		"http",
		"astro",
		"javascript",
		"typescript",
		"tsx",
		"sql",
		"json",
		"yaml",
		"markdown",
		"markdown_inline",
		"vim",
		"vimdoc",
		"query",
	},
}

M.context_init = function()
	vim.keymap.set("n", "[c", function()
		require("treesitter-context").go_to_context(vim.v.count1)
	end, { silent = true })
end

M.context_config = function()
	require("treesitter-context").setup({
		enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
		max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
		min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
		line_numbers = true,
		mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
		-- Separator between context and content. Should be a single character string, like '-'.
		-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
		separator = nil,
		zindex = 20, -- The Z-index of the context window
		on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
	})
end

return M

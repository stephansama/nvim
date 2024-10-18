local M = {}

M.INDENT_EXCLUDE_BUFTYPES = {
	"terminal",
	"nofile",
	"quickfix",
	"prompt",
	"neotest-summary",
}

M.INDENT_EXCLUDE_FILETYPES = {
	"alpha",
	"neo-tree",
	"Trouble",
	"trouble",
	"lazy",
	"mason",
	"notify",
	"toggleterm",
	"lazyterm",
	"lspinfo",
	"packer",
	"checkhealth",
	"help",
	"man",
	"gitcommit",
	"TelescopePrompt",
	"TelescopeResults",
	"dashboard",
	"leetcode.nvim",
}

M.WEB_FILETYPES = {
	"hbs",
	"jsx",
	"php",
	"tsx",
	"vue",
	"xml",
	"html",
	"astro",
	"templ",
	"svelte",
	"glimmer",
	"markdown",
	"rescript",
	"handlebars",
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
}

M.EMMET_FILETYPES = {
	"css",
	"pug",
	"vue",
	"html",
	"less",
	"sass",
	"scss",
	"astro",
	"eruby",
	"svelte",
	"htmldjango",
	"htmlangular",
	"javascriptreact",
	"typescriptreact",
}

return M

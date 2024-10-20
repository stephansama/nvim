local M = {}

M.NEOGEN_FILETYPES = {
	"c",
	"sh",
	"go",
	"cpp",
	"lua",
	"php",
	"vue",
	"rust",
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
}

M.VIM_FT_EXTENSIONS = {
	mdx = "markdown.mdx",
	zsh = "sh",
	pcss = "css",
	http = "http",
	templ = "templ",
	postcss = "css",
}

M.INDENT_EXCLUDE_BUFTYPES = {
	"prompt",
	"nofile",
	"quickfix",
	"terminal",
	"neotest-summary",
}

M.INDENT_EXCLUDE_FILETYPES = {
	"man",
	"help",
	"lazy",
	"alpha",
	"mason",
	"notify",
	"packer",
	"lspinfo",
	"trouble",
	"Trouble",
	"neo-tree",
	"lazyterm",
	"dashboard",
	"gitcommit",
	"toggleterm",
	"checkhealth",
	"leetcode.nvim",
	"TelescopePrompt",
	"TelescopeResults",
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

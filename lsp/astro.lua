---@type vim.lsp.Config
return {
	cmd = { "astro-ls", "--stdio" },
	filetypes = { "astro" },
	init_options = { typescript = {} },
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
}

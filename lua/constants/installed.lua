local M = {}

---@see Mason https://mason-registry.dev/registry/list
M.MASON_ENSURE_INSTALLED = {
	"shfmt",
	"shellcheck",
	"prettier",
	"prettierd",
	"stylelint",
	"codelldb",
	"stylua",
	"delve",
	"go-debug-adapter",
	"htmlhint",
	"jsonlint",
	"yamllint",
	"yamlfmt",
	"stylelint",
	"markdownlint",
	"js-debug-adapter",
}

---@see MasonLsp https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
M.MASON_LSP_ENSURE_INSTALLED = {
	"marksman",
	-- docker
	"dockerls",
	"docker_compose_language_service",
	-- HTML
	"html",
	"emmet_ls",
	-- scripting
	"bashls",
	"lua_ls",
	"vimls",
	-- javascript
	"htmx",
	"astro",
	"vuels",
	"eslint",
	"graphql",
	"svelte",
	"ts_ls",
	-- css
	"cssls",
	"cssmodules_ls",
	"tailwindcss",
	-- systems
	"omnisharp",
	"clangd",
	"cmake",
	"zls",
	-- data formats
	"taplo", -- toml
	"jsonls",
	"yamlls",
	"lemminx", --xml
	"graphql",
	-- golang
	"templ",
	"gopls",
}

---@see Treesitter https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
M.TREESITTER_ENSURE_INSTALLED = {
	-- systems programming
	"c",
	"cpp",
	"cmake",
	"c_sharp",
	"dockerfile",
	"zig",
	"rust",
	"go",
	"gomod",
	"gosum",
	"tmux",
	-- lua
	"lua",
	"luadoc",
	-- web technologies
	"css",
	"html",
	"http",
	-- javascript
	"astro",
	"svelte",
	"templ",
	"jsdoc",
	"javascript",
	"typescript",
	"tsx",
	"vue",
	-- data
	"csv",
	"sql",
	"xml",
	"json",
	"yaml",
	"toml",
	"graphql",
	-- note taking
	"markdown",
	"markdown_inline",
	"vim",
	"vimdoc",
	"query",
}

return M

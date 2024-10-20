local M = {}

---@see Mason https://mason-registry.dev/registry/list
M.MASON_ENSURE_INSTALLED = {
	"delve",
	"shfmt",
	"hlint",
	"ormolu",
	"stylua",
	"yamlfmt",
	"codelldb",
	"htmlhint",
	"jsonlint",
	"prettier",
	"yamllint",
	"prettierd",
	"stylelint",
	"shellcheck",
	"markdownlint",
	"go-debug-adapter",
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
	"ts_ls",
	"eslint",
	"svelte",
	"graphql",
	-- css
	"cssls",
	"cssmodules_ls",
	"tailwindcss",
	-- systems
	"omnisharp",
	"clangd",
	"cmake",
	"zls",
	"hls",
	-- data formats
	"taplo", -- toml
	"jsonls",
	"yamlls",
	"lemminx", --xml
	"graphql",
	-- golang
	"gopls",
	"templ",
}

---@see Treesitter https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
M.TREESITTER_ENSURE_INSTALLED = {
	-- systems programming
	"c",
	"go",
	"cpp",
	"zig",
	"rust",
	"cmake",
	"gomod",
	"gosum",
	"python",
	"haskell",
	"c_sharp",
	"dockerfile",
	-- configs
	"tmux",
	"gitignore",
	"editorconfig",
	-- lua
	"lua",
	"luadoc",
	-- web technologies
	"css",
	"html",
	"http",
	-- javascript
	"tsx",
	"vue",
	"astro",
	"templ",
	"jsdoc",
	"svelte",
	"javascript",
	"typescript",
	-- data
	"csv",
	"sql",
	"xml",
	"json",
	"yaml",
	"toml",
	"graphql",
	-- note taking
	"vim",
	"query",
	"vimdoc",
	"markdown",
	"markdown_inline",
}

return M

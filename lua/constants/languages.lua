local M = {}

---object used to describe a specific language toolchain
---@class LanguageObject
--- [Documentation](https://mason-registry.dev/registry/list)
---@field mason table<string> | nil
--- [Documentation](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers)
---@field mason_lsp table<string> | string | nil
--- [Documentation](https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters)
---@field linters table<string,table<string>> | string | nil
--- [Documentation](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
---@field servers table<string,table<string>> | string | nil
--- [Documentation](https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters)
---@field formatters table<string,table> | string | nil
--- [Documentation](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages)
---@field treesitter table<string,table> | string | nil

---@type LanguageObject
M.base = {
	mason_lsp = "vimls",
	treesitter = {
		"vim",
		"query",
		"vimdoc",
		"gitignore",
		"editorconfig",
	},
}

---@type LanguageObject
M.markdown = {
	linters = "markdownlint",
	formatters = "markdownlint",
	treesitter = { "markdown", "markdown_inline" },
	mason_lsp = { "marksman", "mdx_analyzer" },
	servers = { "marksman", "mdx_analyzer" },
}

---@type LanguageObject
M.shell = {
	mason = { "shfmt", "shellcheck" },
	servers = "bashls",
	mason_lsp = "bashls",
	treesitter = { "bash", "tmux" },
	linters = {
		sh = { "shellcheck" },
		zsh = { "zsh" },
	},
	formatters = {
		sh = { "shfmt" },
		zsh = { "shfmt" },
		zshrc = { "shfmt" },
	},
}

---@type LanguageObject
M.data = {
	mason = { "jsonlint", "yamllint" },
	mason_lsp = {
		"taplo",
		"jsonls",
		"yamlls",
		"lemminx",
		"graphql",
	},
	formatters = {
		toml = { "taplo" },
		yaml = { "yamlfmt" },
	},
	linters = { json = { "jsonlint" } },
	servers = { "sqlls", "yamlls", "jsonls", "graphql" },
	treesitter = {
		"csv",
		"sql",
		"xml",
		"json",
		"toml",
		"yaml",
		"graphql",
	},
}

---@type LanguageObject
M.lua = {
	mason = { "stylua" },
	mason_lsp = { "lua_ls" },
	formatters = "stylua",
	treesitter = { "lua", "luadoc" },
}

---@type LanguageObject
M.javascript = {
	mason = {
		"htmlhint",
		"prettier",
		"prettierd",
		"stylelint",
		"js-debug-adapter",
	},
	mason_lsp = {
		"html",
		"htmx",
		"astro",
		"cssls",
		"ts_ls",
		"vuels",
		"eslint",
		"svelte",
		"emmet_ls",
		"tailwindcss",
		"cssmodules_ls",
	},
	servers = {
		"html",
		"htmx",
		"astro",
		"cssls",
		"ts_ls",
		"vuels",
		"eslint",
		"svelte",
		"tailwindcss",
		"cssmodules_ls",
	},
	linters = {
		css = { "stylelint" },
		html = { "htmlhint" },
		javascript = { "eslint" },
		typescript = { "eslint" },
	},
	formatters = {
		css = { "prettier" },
		html = { "prettier" },
		astro = { "prettier" },
		svelte = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
	},
	treesitter = {
		"css",
		"tsx",
		"vue",
		"html",
		"http",
		"astro",
		"jsdoc",
		"svelte",
		"javascript",
		"typescript",
	},
}

---@type LanguageObject
M.docker = {
	mason_lsp = { "dockerls", "docker_compose_language_service" },
	treesitter = "dockerfile",
}

---@type LanguageObject
M.haskell = {
	mason = { "ormolu", "hlint" },
	mason_lsp = "hls",
	servers = "hls",
	linters = "hlint",
	formatters = "ormolu",
	treesitter = "haskell",
}

---@type LanguageObject
M.go = {
	formatters = "gofmt",
	mason = { "delve", "go-debug-adapter" },
	mason_lsp = { "gopls", "templ" },
	treesitter = { "go", "gomod", "gosum", "templ" },
}

---@type LanguageObject
M.cpp = {
	mason = { "codelldb" },
	mason_lsp = { "clangd", "cmake" },
	servers = { "clangd", "cmake" },
	treesitter = { "c", "cpp", "cmake" },
}

---@type LanguageObject
M.rust = { treesitter = "rust" }

---@type LanguageObject
M.zig = { mason_lsp = "zls", servers = "zls", treesitter = "zig" }

return M

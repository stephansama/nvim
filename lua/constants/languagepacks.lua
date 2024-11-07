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
---@field formatters table<string,table<string>|nil> | string | nil
--- [Documentation](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages)
---@field treesitter table<string,table> | string | nil
--- Telescope extensions to enable for language
---@field telescope_extensions table<string,table> | string | nil

---@type LanguageObject
M.base = {
	mason_lsp = "vimls",
	servers = "vimls",
	treesitter = {
		"kdl",
		"vim",
		"rasi",
		"regex",
		"query",
		"vimdoc",
		"kconfig",
		"hyprlang",
		"gitignore",
		"editorconfig",
	},
}

---@type LanguageObject
M.markdown = {
	mason = { "markdownlint" },
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
	mason = { "jsonlint", "yamllint", "sqlfmt" },
	mason_lsp = {
		"sqlls",
		"taplo",
		"jsonls",
		"yamlls",
		"lemminx",
		"graphql",
	},
	formatters = {
		sql = { "sqlfmt" },
		toml = { "taplo" },
		yaml = { "yamlfmt" },
	},
	linters = {
		json = { "jsonlint" },
	},
	servers = {
		"sqlls",
		"taplo",
		"yamlls",
		"jsonls",
		"graphql",
	},
	treesitter = {
		"csv",
		"sql",
		"xml",
		"toml",
		"yaml",
		"json",
		"jsonc",
		"json5",
		"graphql",
	},
}

---@type LanguageObject
M.lua = {
	formatters = "stylua",
	mason = { "stylua" },
	mason_lsp = "lua_ls",
	servers = "lua_ls",
	treesitter = { "lua", "luadoc" },
}

---@type LanguageObject
M.javascript = {
	telescope_extensions = "package_info",
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
		"scss",
		"astro",
		"jsdoc",
		"svelte",
		"robots",
		"javascript",
		"typescript",
	},
}

---@type LanguageObject
M.docker = {
	mason_lsp = { "dockerls", "docker_compose_language_service" },
	servers = { "dockerls", "docker_compose_language_service" },
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
	servers = { "gopls", "templ" },
	treesitter = {
		"go",
		"templ",
		"gomod",
		"gosum",
		"gowork",
	},
}

---@type LanguageObject
M.cpp = {
	mason = {
		"clang-format",
		"checkmake",
		"codelldb",
		"cpplint",
		"cmakelang",
	},
	mason_lsp = { "clangd", "cmake" },
	servers = { "clangd", "cmake" },
	linters = {
		cpp = { "cpplint" },
		make = { "checkmake" },
	},
	formatters = {
		cpp = { "clang-format" },
		cmake = { "cmake_format" },
	},
	treesitter = { "c", "cpp", "cmake", "make" },
}

---@type LanguageObject
M.python = {
	mason = { "autopep8", "djlint", "pylint" },
	mason_lsp = { "pyright", "jinja_lsp" },
	servers = { "pyright", "jinja_lsp" },
	linters = {
		python = { "pylint" },
		htmldjango = { "djlint" },
	},
	formatters = {
		python = { "autopep8" },
		htmldjango = { "djlint" },
	},
	treesitter = { "python", "htmldjango", "jinja2", "requirements" },
}

---@type LanguageObject
M.rust = { treesitter = "rust" }

---@type LanguageObject
M.zig = { mason_lsp = "zls", servers = "zls", treesitter = "zig" }

---@type LanguageObject
M.php = {
	mason = { "pint", "phpcs" },
	mason_lsp = "intelephense",
	servers = "intelephense",
	linters = "phpcs",
	formatters = "pint",
	treesitter = { "php", "phpdoc" },
}

---@type LanguageObject
M.java = {
	mason_lsp = "jdtls",
	servers = "jdtls",
	treesitter = { "java" },
}

---@type LanguageObject
M.csharp = {
	mason = { "csharpier" },
	mason_lsp = "omnisharp",
	servers = "omnisharp",
	formatters = "csharpier",
	treesitter = "c_sharp",
}

---@type LanguageObject
M.snyk = { mason_lsp = "snyk_ls", servers = "snyk_ls" }

---@type LanguageObject
M.powershell = { mason_lsp = "powershell_es", servers = "powershell_es", treesitter = "powershell" }

return M

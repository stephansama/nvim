local M = {}

---@class TreesitterParserInstallInfo
---@field url string
---@field files string[]
---@field branch string

---@class TreesitterParser
---@field filetype string
---@field install_info TreesitterParserInstallInfo

---object used to describe a specific language toolchain
---@class LanguageObject
--- [Documentation](https://mason-registry.dev/registry/list)
---@field mason table<string> | nil
--- [Documentation](https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters)
---@field linters table<string,table<string>> | string | nil
--- [Documentation](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
---@field servers table<string,table<string>> | string | nil
--- [Documentation](https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters)
---@field formatters table<string,table<string>|function|nil> | string | nil
--- [Documentation](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages)
---@field treesitter table<string,table> | string | nil
--- [Documentation]()
---@field treesitter_parser table<string, TreesitterParser> | nil
--- Telescope extensions to enable for language
---@field telescope_extensions table<string,table> | string | nil

---@type LanguageObject
M.base = {
	mason = { "vim-language-server" },
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
M.nix = {
	servers = "nil_ls",
	treesitter = "nix",
}

---@type LanguageObject
M.markdown = {
	mason = { "markdownlint" },
	linters = "markdownlint",
	servers = { "marksman", "mdx_analyzer" },
	treesitter = { "markdown", "markdown_inline" },
	formatters = {
		markdown = require("utils.pull").prettier_formatter_or({ "markdownlint" }),
	},
}

---@type LanguageObject
M.shell = {
	mason = { "shfmt", "shellcheck" },
	servers = "bashls",
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
	mason = {
		"json-lsp",
		"jsonlint",
		"yaml-language-server",
		"yamlfmt",
		"yamllint",
		"sqlfmt",
		"xmlformatter",
		"lemminx",
		"taplo",
	},
	formatters = {
		sql = { "sql_formatter" },
		toml = { "taplo" },
		yaml = { "yamlfmt" },
		xml = { "xmlformatter" },
		jsonc = require("utils.pull").prettier_formatter_or({}),
		json = require("utils.pull").prettier_formatter_or({}),
	},
	linters = {
		json = { "jsonlint" },
	},
	servers = {
		"sqls",
		"taplo",
		"yamlls",
		"jsonls",
		"graphql",
		"lemminx",
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
	mason = { "luacheck", "stylua" },
	linters = "luacheck",
	formatters = "stylua",
	servers = "lua_ls",
	treesitter = { "lua", "luadoc" },
}

---@type LanguageObject
M.javascript = {
	telescope_extensions = "package_info",
	mason = {
		"emmet-ls",
		"astro-language-server",
		"vue-language-server",
		"svelte-language-server",
		"cssmodules-language-server",
		"tailwindcss-language-server",
		"typescript-language-server",
		"html-lsp",
		"htmlhint",
		"prettier",
		"prettierd",
		"stylelint",
		"stylelint-lsp",
		"js-debug-adapter",
	},
	servers = {
		"html",
		"astro",
		"cssls",
		"emmet_ls",
		os.getenv("TSGOPATH") and "tsgo" or "ts_ls",
		"volar",
		"eslint",
		"svelte",
		"tailwindcss",
		"cssmodules_ls",
		"stylelint_lsp",
	},
	linters = {
		css = { "stylelint" },
		html = { "htmlhint" },
		javascript = { "eslint" },
		typescript = { "eslint" },
	},
	formatters = {
		css = { "prettier" },
		vue = { "prettier" },
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
	mason = { "dockerfile-language-server", "docker-compose-language-service" },
	servers = { "dockerls", "docker_compose_language_service" },
	treesitter = "dockerfile",
}

---@type LanguageObject
M.haskell = {
	mason = { "ormolu", "hlint", "haskell-language-server" },
	servers = "hls",
	linters = "hlint",
	formatters = "ormolu",
	treesitter = "haskell",
}

---@type LanguageObject
M.go = {
	formatters = "gofmt",
	mason = { "delve", "go-debug-adapter", "gopls", "templ" },
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
M.rust = {
	mason = { "htmx-lsp" },
	treesitter = "rust",
	servers = "htmx",
}

---@type LanguageObject
M.zig = {
	mason = { "zls" },
	servers = "zls",
	treesitter = "zig",
}

---@type LanguageObject
M.php = {
	mason = { "pint", "phpcs", "blade-formatter" },
	servers = "intelephense",
	linters = "phpcs",
	formatters = { "pint", "blade-formatter" },
	treesitter = { "php", "phpdoc" },
	treesitter_parser = {
		["blade"] = {
			filetype = "blade",
			install_info = {
				branch = "main",
				files = { "src/parser.c" },
				url = "https://github.com/EmranMR/tree-sitter-blade",
			},
		},
	},
}

---@type LanguageObject
M.java = { servers = "jdtls", treesitter = { "java" } }

---@type LanguageObject
M.csharp = {
	mason = { "csharpier" },
	servers = "omnisharp",
	formatters = "csharpier",
	treesitter = "c_sharp",
}

---@type LanguageObject
M.snyk = { servers = "snyk_ls" }

---@type LanguageObject
M.powershell = { servers = "powershell_es", treesitter = "powershell" }

return M

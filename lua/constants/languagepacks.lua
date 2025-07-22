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

---@type LanguageObject
M.base = {
	mason = { "vim-language-server", "cspell", "editorconfig-checker" },
	servers = "vimls",
	linters = {
		editorconfig = { "editorconfig-checker" },
	},
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
	servers = { "marksman", "mdx_analyzer" },
	treesitter = { "markdown", "markdown_inline" },
	formatters = {
		markdown = { "prettier", "markdownlint" },
	},
}

---@type LanguageObject
M.shell = {
	mason = { "shfmt", "shellcheck", "bash-language-server" },
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
		jsonc = { "prettier" },
		json = { "prettier" },
		toml = { "taplo" },
		yaml = { "prettier", "yamlfmt" },
		sql = { "sql_formatter" },
		xml = { "xmlformatter" },
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
	mason = { "luacheck", "stylua", "lua-language-server" },
	linters = "luacheck",
	formatters = "stylua",
	servers = "lua_ls",
	treesitter = { "lua", "luadoc" },
}

---@type LanguageObject
M.javascript = {
	mason = {
		"astro-language-server",
		"cssmodules-language-server",
		"emmet-language-server",
		"html-lsp",
		"eslint-lsp",
		"htmlhint",
		"js-debug-adapter",
		"prettier",
		"prettierd",
		"stylelint",
		"stylelint-lsp",
		"svelte-language-server",
		"tailwindcss-language-server",
		"typescript-language-server",
		"vue-language-server",
		"vtsls",
	},
	servers = {
		"astro",
		"cssls",
		"eslint",
		"cssmodules_ls",
		"emmet_language_server",
		"html",
		"stylelint_lsp",
		"svelte",
		"tailwindcss",
		"vue_ls",
		os.getenv("TSGOPATH") and "tsgo" or "vtsls",
	},
	linters = {
		css = { "stylelint" },
		html = { "htmlhint" },
		astro = { "eslint" },
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
		"astro",
		"css",
		"html",
		"http",
		"javascript",
		"jsdoc",
		"robots",
		"scss",
		"svelte",
		"tsx",
		"typescript",
		"vue",
	},
}

---@type LanguageObject
M.docker = {
	mason = { "hadolint", "dockerfile-language-server", "docker-compose-language-service" },
	servers = { "dockerls", "docker_compose_language_service" },
	linters = "hadolint",
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
	mason = { "delve", "go-debug-adapter", "gopls", "templ", "golangcilint" },
	formatters = "gofmt",
	linters = "golangcilint",
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
	treesitter = "rust",
}

---@type LanguageObject
M.zig = {
	mason = { "zls" },
	servers = "zls",
	formatters = { zig = { "zigfmt" } },
	treesitter = "zig",
}

---@type LanguageObject
M.php = {
	mason = { "pint", "phpcs", "blade-formatter", "phpactor" },
	servers = "phpactor",
	linters = "phpcs",
	formatters = { php = { "pint" }, blade = { "blade-formatter" } },
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

---@type LanguageObject
M.terraform = {
	mason = { "tflint" },
	linters = { "tflint" },
	servers = { "teerraformls" },
	treesitter = { "terraform" },
}

return M

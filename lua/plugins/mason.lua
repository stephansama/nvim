local mason_lspconfig = {
	automatic_installation = true,
	ensure_installed = {
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
		"svelte",
		"tsserver",
		-- css
		"cssls",
		"cssmodules_ls",
		"tailwindcss",
		-- systems
		"clangd",
		"cmake",
		-- data formats
		"taplo", -- toml
		"jsonls",
		"yamlls",
		"lemminx", --xml
		"graphql",
		-- golang
		"templ",
		"gopls",
	},
}

local mason_config = {
	PATH = "prepend",
	registries = { "github:mason-org/mason-registry" },
	ensure_installed = {
		"shfmt",
		"prettier",
		"prettierd",
		"codelldb",
		"stylua",
		"delve",
		"go-debug-adapter",
		"htmlhint",
		"jsonhint",
		"stylelint",
		"markdownlint",
	},
	ui = {
		border = "rounded",
		icons = {
			-- package_pending = "➜",
			-- package_installed = "✓",
			-- package_uninstalled = "✗",
			package_pending = "󰶻",
			package_installed = "󰄴",
			package_uninstalled = "󰅘",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},
}

return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = mason_config,
		config = function(_, opts)
			require("mason").setup(opts)
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if mason_config.ensure_installed and #mason_config.ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(mason_config.ensure_installed, " "))
				end
			end, {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		lazy = false,
		opts = mason_lspconfig,
		config = true,
	},
}

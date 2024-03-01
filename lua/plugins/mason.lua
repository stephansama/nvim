local mason_lspconfig = {
	automatic_installation = true,
	ensure_installed = {
		"bashls",
		"lua_ls",
		"dockerls",
		"docker_compose_language_service",
		"jsonls",
		"yamlls",
		"lemminx", --xml
		"marksman",
		-- web dev
		"html",
		"htmx",
		"cssls",
		"astro",
		"eslint",
		"svelte",
		"graphql",
		"emmet_ls",
		"tsserver",
		"cssmodules_ls",
		"tailwindcss",
		-- systems
		"clangd",
		"taplo", -- toml
		"cmake",
		"gopls",
	},
}

local mason_config = {
	PATH = "prepend",
	registries = { "github:mason-org/mason-registry" },
	ui = {
		icons = {
			package_pending = " ",
			package_installed = "󰄳 ",
			package_uninstalled = " 󰚌",
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
		config = function()
			require("mason").setup(mason_config)
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
		config = function()
			require("mason-lspconfig").setup(mason_lspconfig)
		end,
	},
}

local M = {}

M.lspopts = {
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

M.opts = {
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

M.config = function(opts)
	require("mason").setup(opts)
	-- custom nvchad cmd to install all mason binaries listed
	vim.api.nvim_create_user_command("MasonInstallAll", function()
		if opts.ensure_installed and #opts.ensure_installed > 0 then
			vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
		end
	end, {})
end

M.lspconfig = function(opts)
	require("mason-lspconfig").setup(opts)
end

return M

local M = {}

M.lspopts = {
	automatic_installation = false,
	ensure_installed = {
		"astro",
		"gopls",
		"bashls",
		"lua_ls",
		"tsserver",
	},
}

M.opts = {
	-- ensure_installed = { "lua-language-server" }, -- not an option from mason.nvim
	PATH = "skip",
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

	-- max_concurrent_installers = 10,
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

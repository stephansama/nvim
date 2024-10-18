local installed = require("constants.installed")
local MASON_ENSURE_INSTALLED, MASON_LSP_ENSURE_INSTALLED =
	installed.MASON_ENSURE_INSTALLED, installed.MASON_LSP_ENSURE_INSTALLED

local MasonInstallAll = function()
	if MASON_ENSURE_INSTALLED and #MASON_ENSURE_INSTALLED > 0 then
		vim.cmd("MasonInstall " .. table.concat(MASON_ENSURE_INSTALLED, " "))
	end
end

local keymaps = {
	uninstall_server = "X",
	install_server = "i",
	update_server = "u",
	update_all_servers = "U",
	check_server_version = "c",
	check_outdated_servers = "C",
	cancel_installation = "<C-c>",
	toggle_server_expand = "<CR>",
}

local mason_opts = {
	PATH = "prepend",
	registries = { "github:mason-org/mason-registry" },
	ensure_installed = MASON_ENSURE_INSTALLED,
	ui = {
		icons = require("configs.icons").mason,
		border = "rounded",
		keymaps = keymaps,
	},
}

local masonlsp_opts = {
	ensure_installed = MASON_LSP_ENSURE_INSTALLED,
	automatic_installation = true,
}

return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = mason_opts,
		config = function(_, opts)
			require("mason").setup(opts)
			vim.api.nvim_create_user_command("MasonInstallAll", MasonInstallAll, {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = true,
		lazy = false,
		opts = masonlsp_opts,
	},
}

local installed = require("constants.installed")
local MASON_ENSURE_INSTALLED, MASON_LSP_ENSURE_INSTALLED =
	installed.MASON_ENSURE_INSTALLED, installed.MASON_LSP_ENSURE_INSTALLED

local MasonInstallAll = function()
	if MASON_ENSURE_INSTALLED and #MASON_ENSURE_INSTALLED > 0 then
		vim.cmd("MasonInstall " .. table.concat(MASON_ENSURE_INSTALLED, " "))
	end
end

local mason_opts = {
	PATH = "prepend",
	registries = { "github:mason-org/mason-registry" },
	ensure_installed = MASON_ENSURE_INSTALLED,
	ui = {
		icons = require("configs.icons").mason,
		border = "rounded",
		keymaps = require("keys.init").mason,
	},
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
		opts = { ensure_installed = MASON_LSP_ENSURE_INSTALLED, automatic_installation = true },
	},
}

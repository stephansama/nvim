local MASON_ENSURE_INSTALLED = require("plugins.lang").MASON

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
		icons = require("icons").mason,
		border = "rounded",
		keymaps = require("keys.plugin").mason,
	},
}

return {
	{
		"mason-org/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = mason_opts,
		config = function(_, opts)
			require("mason").setup(opts)
			vim.api.nvim_create_user_command("MasonInstallAll", MasonInstallAll, {})
		end,
	},
}

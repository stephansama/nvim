local lang = require("plugins.lang")
local MASON_ENSURE_INSTALLED = lang.MASON

table.insert(lang.MASON_REGISTRIES, "github:mason-org/mason-registry")

local function MasonInstallAll()
	if MASON_ENSURE_INSTALLED and #MASON_ENSURE_INSTALLED > 0 then
		vim.cmd("MasonInstall " .. table.concat(MASON_ENSURE_INSTALLED, " "))
	end
end

return { {
	"mason-org/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
	opts = {
		PATH = "prepend",
		registries = lang.MASON_REGISTRIES,
		ensure_installed = MASON_ENSURE_INSTALLED,
		ui = {
			icons = require("icons").mason,
			border = "rounded",
			keymaps = require("keys.plugin").mason,
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		vim.api.nvim_create_user_command("MasonInstallAll", MasonInstallAll, {})
	end,
} }

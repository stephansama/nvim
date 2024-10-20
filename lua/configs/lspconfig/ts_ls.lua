local M = {}
local inlayHints = {
	includeInlayVariableTypeHints = true,
	includeInlayParameterNameHints = "all",
	includeInlayEnumMemberValueHints = true,
	includeInlayFunctionParameterTypeHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayVariableTypeHintsWhenTypeMatchesName = false,
	includeInlayParameterNameHintsWhenArgumentMatchesName = false,
}

---@param client unknown
---@param bufnr unknown
---@param on_attach function
M.on_attach = function(client, bufnr, on_attach)
	on_attach(client, bufnr)
	require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
end

M.settings = {
	javascript = { inlayHints = inlayHints },
	typescript = { inlayHints = inlayHints },
	init_options = { preferences = { disableSuggestions = true } },
}

M.setup = {
	tsserver = function(_, opts)
		require("typescript").setup({ server = opts })
		return true
	end,
	astro = function(_, opts)
		require("astro-language-server").setup({ server = opts })
		return true
	end,
}

return M

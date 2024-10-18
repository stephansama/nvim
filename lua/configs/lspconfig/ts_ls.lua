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

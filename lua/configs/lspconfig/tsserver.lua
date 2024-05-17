return {
	settings = {
		init_options = { preferences = { disableSuggestions = true } },
		typescript = {
			inlayHints = {
				includeInlayVariableTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayVariableTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			},
		},
	},
	setup = {
		tsserver = function(_, opts)
			require("typescript").setup({ server = opts })
			return true
		end,
		astro = function(_, opts)
			require("astro-language-server").setup({ server = opts })
			return true
		end,
	},
}

---@type vim.lsp.Config
local M = {}

local inlayHints = {
	parameterNames = { enabled = "all" },
	variableTypes = { enabled = true },
	propertyDeclarationTypes = { enabled = true },
	functionLikeReturnTypes = { enabled = true },
	parameterTypes = { enabled = true },
	implementationsCodeLens = { enabled = true },
	referencesCodeLens = { enabled = true },
}

local astroTsPlugin = {
	name = "@astrojs/ts-plugin",
	location = vim.fn.expand("$MASON/packages/astro-language-server/node_modules/@astrojs/ts-plugin/"),
	enableForWorkspaceTypeScriptVersions = true,
}

M.settings = {
	javascript = { inlayHints = inlayHints },
	typescript = { inlayHints = inlayHints },
	vtsls = {
		enableMoveToFileCodeAction = true,
		tsserver = {
			globalPlugins = {
				astroTsPlugin,
			},
		},
	},
}

return M

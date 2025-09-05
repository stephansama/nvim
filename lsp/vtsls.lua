---@class vim.lsp.Config
local M = {}

local inlayHints = {
	functionLikeReturnTypes = { enabled = true },
	implementationsCodeLens = { enabled = true },
	parameterNames = { enabled = "all" },
	parameterTypes = { enabled = true },
	propertyDeclarationTypes = { enabled = true },
	referencesCodeLens = { enabled = true },
	variableTypes = { enabled = true },
}

local astro_plugin = {
	name = "@astrojs/ts-plugin",
	location = vim.fn.expand(
		"$MASON/packages/astro-language-server/node_modules/@astrojs/ts-plugin/"
	),
	enableForWorkspaceTypeScriptVersions = true,
}

local vue_language_server_path =
	vim.fn.expand(
		"$MASON/packages/vue-language-server/node_modules/@vue/language-server/"
	)

local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
	enableForWorkspaceTypeScriptVersions = true,
}

M.filetypes =
	{
		"javascript",
		"javascript.jsx",
		"javascriptreact",
		"typescript",
		"typescript.tsx",
		"typescriptreact",
		"vue",
	}

local globalPlugins = { astro_plugin, vue_plugin }

M.settings = {
	javascript = {
		inlayHints = inlayHints,
		suggest = { completeFunctionCalls = true },
		updateImportsOnFileMove = { enabled = "always" },
	},
	typescript = {
		inlayHints = inlayHints,
		suggest = { completeFunctionCalls = true },
		updateImportsOnFileMove = { enabled = "always" },
	},
	vtsls = {
		autoUseWorkspaceTsdk = true,
		enableMoveToFileCodeAction = true,
		tsserver = { globalPlugins = globalPlugins },
		experimental = {
			maxInlayHintLength = 30,
			completion = { enableServerSideFuzzyMatch = true },
		},
	},
}

return M

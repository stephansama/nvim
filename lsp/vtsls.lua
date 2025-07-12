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

M.settings = {
	javascript = { inlayHints = inlayHints },
	typescript = { inlayHints = inlayHints },
	vtsls = { enableMoveToFileCodeAction = true },
}

return M

local M = {}

local hints = {
	constantValues = true,
	parameterNames = true,
	rangeVariableTypes = true,
	assignVariableTypes = true,
	compositeLiteralTypes = true,
	functionTypeParameters = true,
	compositeLiteralFields = true,
}

M.gopls = {
	hints = hints,
}

return M

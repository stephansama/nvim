local hints = {
	constantValues = true,
	parameterNames = true,
	rangeVariableTypes = true,
	assignVariableTypes = true,
	compositeLiteralTypes = true,
	functionTypeParameters = true,
	compositeLiteralFields = true,
}

---@type vim.lsp.Config
return {
	settings = {
		gopls = { hints = hints },
	},
}

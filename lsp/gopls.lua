local hints = {
	constantValues = true,
	parameterNames = true,
	rangeVariableTypes = true,
	assignVariableTypes = true,
	compositeLiteralTypes = true,
	functionTypeParameters = true,
	compositeLiteralFields = true,
}

return {
	settings = {
		gopls = { hints = hints },
	},
}

local opts = {
	validate = true,
	lint = { unknownAtRules = "ignore" },
}

---@type vim.lsp.Config
return {
	settings = {
		css = opts,
		scss = opts,
		less = opts,
	},
}

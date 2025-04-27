local InlayHints = {
	Enabled = true,
	Designators = true,
	DeducedTypes = true,
	ParameterNames = true,
}

---@type vim.lsp.Config
return {
	settings = {
		clangd = {
			fallbackFlags = { "-std=c++20" },
			InlayHints = InlayHints,
		},
	},
}

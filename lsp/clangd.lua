local InlayHints = {
	Enabled = true,
	Designators = true,
	DeducedTypes = true,
	ParameterNames = true,
}

return {
	settings = {
		clangd = {
			fallbackFlags = { "-std=c++20" },
			InlayHints = InlayHints,
		},
	},
}

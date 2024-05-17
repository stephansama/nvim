return {
	clangd = {
		fallbackFlags = { "-std=c++20" },
		InlayHints = {
			Designators = true,
			Enabled = true,
			ParameterNames = true,
			DeducedTypes = true,
		},
	},
}

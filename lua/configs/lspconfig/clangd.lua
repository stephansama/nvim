local M = {}

local InlayHints = {
	Enabled = true,
	Designators = true,
	DeducedTypes = true,
	ParameterNames = true,
}

M.clangd = {
	fallbackFlags = { "-std=c++20" },
	InlayHints = InlayHints,
}

return M

local opts = { validate = true, lint = { unknownAtRules = "ignore" } }

return {
	css = opts,
	scss = opts,
	less = opts,
}

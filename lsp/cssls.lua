local opts = { validate = true, lint = { unknownAtRules = "ignore" } }

return {
	settings = {
		css = opts,
		scss = opts,
		less = opts,
	},
}

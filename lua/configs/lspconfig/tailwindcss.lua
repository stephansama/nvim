local M = {}

M.on_attach = function(a, b, callback)
	callback(a, b)
	require("tailwindcss-colors").buf_attach(b)
end

return M

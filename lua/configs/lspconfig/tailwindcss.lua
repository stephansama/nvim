local M = {}

--- attach tailwindcss-colors
---@param client unknown
---@param buffer unknown
---@param on_attach function
M.on_attach = function(client, buffer, on_attach)
	on_attach(client, buffer)
	require("tailwindcss-colors").buf_attach(buffer)
end

return M

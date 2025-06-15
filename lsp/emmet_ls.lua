---@type vim.lsp.Config
local M = {}

M.filetypes = require("constants.ft").EMMET_FILETYPES

M.settings = {
	-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
	init_options = { html = { options = { ["bem.enabled"] = true } } },
}

return M

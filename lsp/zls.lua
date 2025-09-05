--- https://zigtools.org/zls/install/

---@class vim.lsp.Config
local M = {}

M.ft = { "zig", "zir" }
M.root_markers = { "zls.json", "build.zig", ".git" }

return M

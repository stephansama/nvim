--- https://zigtools.org/zls/install/
local mason_registry = require("mason-registry")
local zls = mason_registry.get_package("zls")
local zlsExecutable = zls:get_latest_version() .. "/zls"

---@class vim.lsp.Config
local M = {}

M.cmd = { zlsExecutable }
M.ft = { "zig", "zir" }
M.root_markers = { "zls.json", "build.zig", ".git" }
M.settings = { zls = { zig_exe_path = zlsExecutable } }

return M

--- https://zigtools.org/zls/install/
local function get_zls()
	return require("mason-registry").get_package("zls")
end

local path = pcall(get_zls)
local zls = path and path or nil
local zlsExecutable = zls and zls:get_latest_version() .. "/zls" or nil

---@class vim.lsp.Config
local M = {}

M.cmd = { zlsExecutable }
M.ft = { "zig", "zir" }
M.root_markers = { "zls.json", "build.zig", ".git" }
M.settings = {
	zls = { zig_exe_path = zlsExecutable },
}

return M

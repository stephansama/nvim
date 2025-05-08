--- https://zigtools.org/zls/install/
local mason_registry = require("mason-registry")
local zls = mason_registry.get_package("zls")
local zlsExecutable = zls:get_latest_version() .. "/zls"

---@type vim.lsp.Config
return {
	cmd = { zlsExecutable },
	root_markers = { "zls.json", "build.zig", ".git" },
	ft = { "zig", "zir" },
	settings = { zls = { zig_exe_path = zlsExecutable } },
}

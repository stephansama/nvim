--- https://zigtools.org/zls/install/
local mason_registry = require("mason-registry")
local zls = mason_registry.get_package("zls")
local zlsExecutable = zls:get_install_path() .. "/zls"

return {
	cmd = { zlsExecutable },
	root_markers = { "zls.json", "build.zig", ".git" },
	ft = { "zig", "zir" },
	settings = { zls = { zig_exe_path = zlsExecutable } },
}

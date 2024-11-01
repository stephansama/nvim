local M = {}

M.PLUGINS = {
	"ui",
	"lang",
	"editor",
	"test",
	"debug",
}

M.LANGUAGES = {
	"base",
	"lua",
	"data",
	"shell",
	"docker",
	"markdown",
	"javascript",
	--- extras
	"go",
	"cpp",
	"zig",
	"rust",
	"haskell",
	-- "php",
	-- "java",
	-- "godot",
	-- "python",
	-- "csharp",
	-- "snyk",
}

M.TELESCOPE_EXTENSIONS = {
	"fzf",
	"tmux",
	"macros",
	"package_info",
	"git_file_history",
}

return M

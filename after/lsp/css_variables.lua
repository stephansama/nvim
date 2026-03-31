---@type vim.lsp.Config
local M = {}

M.settings = {
	cssVariables = {
		blacklistFolders = {
			"**/.cache",
			"**/.DS_Store",
			"**/.git",
			"**/.hg",
			"**/.next",
			"**/.svn",
			"**/bower_components",
			"**/CVS",
			"**/dist",
			"**/build",
			"**/node_modules",
			"**/tests",
			"**/tmp",
		},
		lookupFiles = { "**/*.less", "**/*.scss", "**/*.sass", "**/*.css" },
	},
}

return M


---
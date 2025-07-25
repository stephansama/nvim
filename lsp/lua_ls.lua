---@class vim.lsp.Config
local M = {}

M.cmd = { "lua-language-server" }
M.filetypes = { "lua" }

M.root_markers = {
	".luarc.json",
	".luarc.jsonc",
	".luacheckrc",
	".stylua.toml",
	"stylua.toml",
	"selene.toml",
	"selene.yml",
	".git",
}

M.on_init = function(client)
	if client.workspace_folders then
		local path = client.workspace_folders[1].name
		if
			path ~= vim.fn.stdpath("config")
			and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
		then
			return
		end
	end
end

M.settings = {
	Lua = {
		diagnostics = { globals = { "vim" } },
		hint = { enable = true },
		runtime = { version = "LuaJIT" },
		workspace = { library = { vim.env.VIMRUNTIME } },
	},
}

return M

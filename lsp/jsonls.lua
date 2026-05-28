local extra = { {
	description = "Luarc",
	fileMatch = { "**/.luarc.json" },
	name = "luarc",
	url = "https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json",
}, {
	description = "Typedoc",
	fileMatch = { "**/typedoc.json" },
	name = "typedoc",
	url = "https://typedoc.org/schema.json",
} }

---@type vim.lsp.Config
return {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas({ extra = extra }),
		},
	},
}

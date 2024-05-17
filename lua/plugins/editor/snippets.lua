--- Load snippets from various sources
---@param _ unknown discard
---@param opts table table of options
local load_snippets = function(_, opts)
	local luasnip, from_vscode, from_snipmate, from_lua =
		require("luasnip"),
		require("luasnip.loaders.from_vscode"),
		require("luasnip.loaders.from_snipmate"),
		require("luasnip.loaders.from_lua")

	luasnip.config.set_config(opts)

	from_vscode.lazy_load({ paths = { "./snippets" } })

	from_snipmate.load()
	from_snipmate.lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

	from_lua.load()
	from_lua.lazy_load({ paths = vim.g.lua_snippets_path or "" })

	vim.api.nvim_create_autocmd("InsertLeave", {
		callback = function()
			if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()] and not luasnip.session.jump_active then
				luasnip.unlink_current()
			end
		end,
	})
end

return {
	"L3MON4D3/LuaSnip",
	opts = { history = true, updateevents = "TextChanged,TextChangedI" },
	config = load_snippets,
}

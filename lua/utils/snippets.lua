return function(_, opts)
	local luasnip, from_vscode, from_snipmate, from_lua =
		require("luasnip"),
		require("luasnip.loaders.from_vscode"),
		require("luasnip.loaders.from_snipmate"),
		require("luasnip.loaders.from_lua")

	luasnip.config.set_config(opts)

	local snippetsDir = { "./snippets" }

	from_vscode.lazy_load({ paths = snippetsDir })

	from_snipmate.load()
	from_snipmate.lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

	from_lua.load()
	from_lua.lazy_load({ paths = vim.g.lua_snippets_path or "" })

	local callback = function()
		if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()] and not luasnip.session.jump_active then
			luasnip.unlink_current()
		end
	end

	vim.api.nvim_create_autocmd("InsertLeave", { callback = callback })
end

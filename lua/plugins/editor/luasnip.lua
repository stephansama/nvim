local function config(_, opts)
	local luasnip, from_vscode, from_snipmate, from_lua =
		require("luasnip"),
		require("luasnip.loaders.from_vscode"),
		require("luasnip.loaders.from_snipmate"),
		require("luasnip.loaders.from_lua")

	luasnip.config.set_config(opts)

	from_vscode.lazy_load({
		paths = { require("config.constants").SNIPPETS_DIR },
	})

	local vscode_folder = "./.vscode/"

	if vim.fn.isdirectory(vscode_folder) then
		local dir = vim.fn.readdir(vscode_folder)
		if #dir > 0 then
			for _, filename in ipairs(dir) do
				if filename:match("%.code%-snippets$") then
					from_vscode.load_standalone({
						path = vscode_folder .. filename,
						override_priority = true,
					})
				end
			end
		end
	end

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

return {
	"L3MON4D3/LuaSnip",
	config = config,
	build = "make install_jsregexp",
	opts = {
		history = true,
		updateevents = "TextChanged,TextChangedI",
	},
}

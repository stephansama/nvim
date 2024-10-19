local M = {}

M.setup_sign_icons = function(icons, hl_callback)
	for type, icon in pairs(icons) do
		local hl = hl_callback(type)
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

--- default fields order i.e completion word + item.kind + item.kind icons
M.cmp_format = function(_, item)
	local icons = require("configs.icons").cmp
	local icon = icons[item.kind] or ""
	item.kind = string.format("%s %s", (icon .. " ") or icon, item.kind or "")
	return item
end

--- install telescope extension
---@param extensions table
---@return function
M.configure_telescope = function(extensions)
	return function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		for _, extension in pairs(extensions) do
			telescope.load_extension(extension)
		end
	end
end

--- launch url dependent on system
---@param url string
---@return nil
M.openURL = function(url)
	if url == "" then
		return
	end
	vim.cmd("exec \"!open '" .. url .. "'\"")
end

--- Load snippets from various sources
---@param _ unknown discard
---@param opts table table of options
M.load_snippets = function(_, opts)
	local luasnip, from_vscode, from_snipmate, from_lua =
		require("luasnip"),
		require("luasnip.loaders.from_vscode"),
		require("luasnip.loaders.from_snipmate"),
		require("luasnip.loaders.from_lua")

	luasnip.config.set_config(opts)

	from_vscode.lazy_load({ paths = { require("constants.dir").SNIPPETS_DIR } })

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

---@param function_name "toggle" | "open_visual" | "open_file_search" name of function to invoke from spectre
---@return function keymap function used to invoke spectre
M.spectre_function = function(function_name)
	return function()
		local params = function_name ~= "toggle" and { select_word = true } or {}
		require("spectre")[function_name](params)
	end
end

return M

local M = {}

---@param direction 'next'|'prev'
---@return function
M.jump = function(direction)
	return function()
		vim.diagnostic.jump({ count = direction == "next" and 1 or -1, float = true })
	end
end

M.disable_diagnostics = function()
	vim.diagnostic.enable(false)
end

M.lsp_format_code = function()
	vim.lsp.buf.format({ async = true })
end

M.list_workspace_folder = function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folder()))
end

M.create_capabilities = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))

	capabilities = vim.tbl_deep_extend("force", capabilities, {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	})

	return capabilities
end

--- convert directory to lua module
---@param path string
M.convert_dir_to_module = function(path)
	local pattern = "lua"
	local start_pos = path:find(pattern)
	if not start_pos then
		return nil
	end

	local sub_path = path:sub(start_pos + string.len(pattern))

	local converted_path = sub_path:gsub("/", ".")

	return converted_path
end

M.lsp_hover = function()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "package.json" then
		local PACKAGE_JSON_URL = require("constants.url").PACKAGE_JSON_URL
		local text = vim.api.nvim_get_current_line()
		local match = text:match('"(.-)"')
		local npm_link = PACKAGE_JSON_URL .. match
		require("utils").openURL(npm_link)
	elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
		require("crates").show_popup()
	else
		local winid = require("ufo").peekFoldedLinesUnderCursor()
		if not winid then
			vim.lsp.buf.hover()
		end
	end
end

M.setup_borders = function()
	--- LSP Border
	vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
	vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

	local border = require("utils.ui").border("FloatBorder")

	local handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
	}

	for key, v in pairs(handlers) do
		vim.lsp.handlers[key] = v
	end

	local diagnostic_source = "if_many"

	vim.diagnostic.config({
		float = { border = border, source = diagnostic_source },
		virtual_text = { source = diagnostic_source },
	})

	-- To instead override globally
	local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
	---@diagnostic disable-next-line: duplicate-set-field
	vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
		opts = opts or {}
		---@diagnostic disable-next-line: inject-field
		opts.border = opts.border or border
		return orig_util_open_floating_preview(contents, syntax, opts, ...)
	end
end

return M

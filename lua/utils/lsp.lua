local M = {}

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
	local c = require("cmp_nvim_lsp").default_capabilities()
	--- add emmet completion support
	c.textDocument.completion.completionItem.snippetSupport = true
	--- add ufo capabilities
	c.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
	return c
end

--- create options for lsp
---@param options table
---@param on_attach function
---@return table
local setup_lsp = function(options, on_attach)
	local trimmed_options = require("utils").remove_properties({
		"setup",
		"settings",
		"filetypes",
		"on_attach",
		"capabilities",
		"init_options",
	}, options)
	return {
		setup = options.setup or nil,
		settings = options.settings or trimmed_options,
		filetypes = options.filetypes or nil,
		init_options = options.init_options or nil,
		capabilities = options.capabilities,
		on_attach = options.on_attach and function(c, b)
			options.on_attach(c, b, on_attach)
		end or on_attach,
	}
end

--- load all lsp configs
---@param capabilities table
---@param on_attach function
M.load_lsp_configs = function(capabilities, on_attach)
	local configs = {}
	local SERVERS = require("constants.pulled").SERVERS
	local lspconfig = require("lspconfig")
	local ls_output = io.popen("ls " .. require("constants.dir").LSP_CONFIG_DIR, "r")

	if ls_output then
		for file in ls_output:lines() do
			local filename = string.match(file, "(.+)%..+")
			if filename and filename ~= "init" and filename ~= "README" then
				configs[filename] = require("configs.lspconfig." .. filename)
			end
		end
	end

	for _, lsp in ipairs(SERVERS) do
		local options = vim.tbl_deep_extend("force", configs[lsp] or {}, { capabilities = capabilities })
		lspconfig[lsp].setup(setup_lsp(options, on_attach))
	end
end

--- load a single lsp
---@param lspname string lsp name to load
---@param on_attach function
M.load_lsp = function(lspname, capabilities, on_attach)
	local lspconfig = require("lspconfig")
	local options =
		vim.tbl_deep_extend("force", require("configs.lspconfig." .. lspname) or {}, { capabilities = capabilities })
	lspconfig[lspname].setup(setup_lsp(options, on_attach))
	print("loading " .. lspname .. " server")
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

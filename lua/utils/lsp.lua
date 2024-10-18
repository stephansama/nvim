local M = {}

M.lsp_format_code = function()
	vim.lsp.buf.format({ async = true })
end

M.list_workspace_folder = function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folder()))
end

local create_capabilities = function()
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
	local setup_on_attach = function(a, b)
		if options.on_attach then
			return options.on_attach(a, b, on_attach)
		end
		return on_attach(a, b)
	end
	return {
		capabilities = create_capabilities(),
		on_attach = setup_on_attach,
		init_options = options.init_options or nil,
		filetypes = options.filetypes or nil,
		settings = options.settings or options,
		setup = options.setup or nil,
	}
end

M.load_lsp = function(lspname, on_attach)
	local lspconfig = require("lspconfig")
	local package_name = "configs.lspconfig." .. lspname
	local options = require(package_name) or {}
	print("loading " .. lspname .. " lsp")
	print(vim.inspect(options))
	lspconfig[lspname].setup(setup_lsp(options, on_attach))
end

---@param on_attach function
M.load_lsp_configs = function(on_attach)
	local SERVERS = require("constants.servers")
	local DIR = require("constants.dir").LSP_CONFIG_DIR
	local lspconfig = require("lspconfig")
	local ls_output = io.popen("ls " .. DIR, "r")
	local configs = {}

	if ls_output then
		for file in ls_output:lines() do
			local before_period = string.match(file, "(.+)%..+")
			if before_period and before_period ~= "init" then
				configs[before_period] = require("configs.lspconfig." .. before_period)
			end
		end
	end

	for _, lsp in ipairs(SERVERS) do
		lspconfig[lsp].setup(setup_lsp(configs[lsp] or {}, on_attach))
	end
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

	--- setup diagnostic signs
	for type, icon in pairs(require("configs.icons").diagnostics) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	local diagnostic_source = "if_many"

	vim.diagnostic.config({
		float = { border = border, source = diagnostic_source },
		virtual_text = { source = diagnostic_source },
	})

	-- To instead override globally
	local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
	vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or border
		return orig_util_open_floating_preview(contents, syntax, opts, ...)
	end
end

return M

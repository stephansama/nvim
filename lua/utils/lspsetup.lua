local lsp = require("utils.lsp")
local SERVERS = require("plugins.lang").SERVERS
local LSP_CONFIG_DIR = require("config.constants").LSP_CONFIG_DIR

local config_files = vim.fn.readdir(LSP_CONFIG_DIR)

if config_files then
	for _, entry in ipairs(config_files) do
		local full_path = LSP_CONFIG_DIR .. entry
		if vim.fn.filereadable(full_path) == 1 then
			local server = string.match(entry, "(.+)%..+")
			local config = dofile(full_path)
			vim.lsp.config(server, config)
		end
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities =
	vim.tbl_deep_extend(
		"force",
		capabilities,
		require("blink.cmp").get_lsp_capabilities({}, false)
	)
capabilities = vim.tbl_deep_extend("force", capabilities, {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
})

vim.cmd([[hi FloatShadow guifg=white guibg=#1f2335]])
vim.cmd([[hi FloatShadowThrough guifg=white guibg=#1f2335]])

vim.lsp.config("*", { capabilities = capabilities })
vim.lsp.enable(SERVERS)

require("ufo").setup()

--- LSP Border
vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd(
	[[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
)

local border = require("utils.ui").border("FloatBorder")

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = border,
	}),
	["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = border }
	),
}

for key, v in pairs(handlers) do
	vim.lsp.handlers[key] = v
end

local diagnostic_source = "if_many"

local diagnostics = require("icons.init").diagnostics

vim.diagnostic.config({
	float = {
		border = border,
		source = diagnostic_source,
	},
	virtual_text = { source = diagnostic_source },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostics.Error,
			[vim.diagnostic.severity.WARN] = diagnostics.Warn,
			[vim.diagnostic.severity.INFO] = diagnostics.Info,
			[vim.diagnostic.severity.HINT] = diagnostics.Hint,
		},
		linehl = { [vim.diagnostic.severity.INFO] = "DiagnosticInfoMsg" },
		numhl = { [vim.diagnostic.severity.WARN] = "WarningMsg" },
	},
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

local function lsp_hover()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "package.json" then
		local text = vim.api.nvim_get_current_line()
		if not require("utils.init").is_package(text) then
			return vim.lsp.buf.hover()
		end
		local match = text:match('"(.-)"')
		local npm_link = require("config.constants").PACKAGE_JSON_URL .. match
		require("utils").openURL(npm_link)
	elseif vim.fn.expand("%:t") == "Cargo.toml" and require(
		"crates"
	).popup_available() then
		require("crates").show_popup()
	else
		local winid = require("ufo").peekFoldedLinesUnderCursor()
		if not winid then
			vim.lsp.buf.hover()
		end
	end
end

if not _G.LspHoverCommandLoaded then
	_G.LspHoverCommandLoaded = true
	vim.api.nvim_create_user_command("LspHover", lsp_hover, { nargs = 0 })
end

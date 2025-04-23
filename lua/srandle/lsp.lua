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
vim.lsp.config("*", {
	capabilities = capabilities,
})

local servers = require("constants.pulled").SERVERS

vim.lsp.enable(servers)

vim.cmd([[hi FloatShadow guifg=white guibg=#1f2335]])
vim.cmd([[hi FloatShadowThrough guifg=white guibg=#1f2335]])

require("ufo").setup()

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

require("utils.ui").setup_sign_icons(require("icons").diagnostics, function(t)
	return "DiagnosticSign" .. t
end)

local expand_kemaps = require("utils.expand").expand_keymaps

local lsp_hover = require("utils.lsp").lsp_hover

expand_kemaps({
	n = {
		["K"] = { lsp_hover, "LSP Hover" },
		["gd"] = { vim.lsp.buf.definition, "Go to definition" },
		["<leader>fc"] = { vim.lsp.buf.format, "Format code" },
	},
})

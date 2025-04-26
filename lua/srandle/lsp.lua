local expand_kemaps = require("utils.expand").expand_keymaps
local setup_sign_icons = require("utils.ui").setup_sign_icons
local diagnostics = require("icons").diagnostics
local lsp = require("utils.lsp")
local SERVERS = require("constants.pulled").SERVERS

local capabilities = lsp.create_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.enable(SERVERS)

vim.cmd([[hi FloatShadow guifg=white guibg=#1f2335]])
vim.cmd([[hi FloatShadowThrough guifg=white guibg=#1f2335]])

require("ufo").setup()

lsp.setup_borders()

setup_sign_icons(diagnostics, function(t)
	return "DiagnosticSign" .. t
end)

expand_kemaps({
	n = {
		["K"] = { lsp.lsp_hover, "LSP Hover" },
		["gd"] = { vim.lsp.buf.definition, "Go to definition" },
		["<leader>fc"] = { vim.lsp.buf.format, "Format code" },
		["[d"] = { lsp.jump("prev"), "Go to previous diagnostic" },
		["]d"] = { lsp.jump("next"), "Go to next diagnostic" },
	},
})

local expand_kemaps = require("utils.expand").expand_keymaps
local lsp = require("utils.lsp")
local ls_process = require("utils.pull").ls_process
local SERVERS = require("constants.pulled").SERVERS
local LSP_CONFIG_DIR = require("constants.dir").LSP_CONFIG_DIR

ls_process(LSP_CONFIG_DIR, function()
	return true
end, function(client)
	local config = dofile(LSP_CONFIG_DIR .. client .. ".lua")
	vim.lsp.config(client, config)
end)

vim.lsp.config("*", {
	capabilities = lsp.create_capabilities(),
})

vim.lsp.enable(SERVERS)

vim.cmd([[hi FloatShadow guifg=white guibg=#1f2335]])
vim.cmd([[hi FloatShadowThrough guifg=white guibg=#1f2335]])

require("ufo").setup()

lsp.setup_borders()

expand_kemaps({
	n = {
		["K"] = { lsp.lsp_hover, "LSP Hover" },
		["gd"] = { vim.lsp.buf.definition, "Go to definition" },
		["<leader>fc"] = { vim.lsp.buf.format, "Format code" },
		["<leader>ef"] = { ":LspEslintFixAll<CR>", "Fix all eslint issues" },
		["[d"] = { lsp.jump("prev"), "Go to previous diagnostic" },
		["]d"] = { lsp.jump("next"), "Go to next diagnostic" },
	},
})

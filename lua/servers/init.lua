---@see LSPConfig https://github.com/neovim/nvim-lspconfig
local keys = require("keys.lsp")
local utils = require("utils.lsp")

local capabilities = utils.create_capabilities()

utils.setup_borders()

require("ufo").setup()

require("utils.ui").setup_sign_icons(require("icons").diagnostics, function(t)
	return "DiagnosticSign" .. t
end)

local on_attach = function(_, buffer)
	keys.on_attach_keybindings(buffer)
end

keys.default_lsp_keybindings(capabilities, on_attach)

utils.load_lsp_configs(capabilities, on_attach)

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client then
-- 			if client:supports_method("textDocument/completion") then
-- 				vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 			end
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		keys.lsp_callback_keybindings()
	end,
})

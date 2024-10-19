---@see LSPConfig https://github.com/neovim/nvim-lspconfig
local keys = require("keys.lsp")
local utils = require("utils.lsp")

local capabilities = utils.create_capabilities()

utils.setup_borders()

require("ufo").setup()

require("utils").setup_sign_icons(require("configs.icons").diagnostics, function(t)
	return "DiagnosticSign" .. t
end)

local on_attach = function(_, buffer)
	keys.on_attach_keybindings(buffer)
end

keys.default_lsp_keybindings(capabilities, on_attach)

utils.load_lsp_configs(capabilities, on_attach)

-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
local emmet_init_options = { html = { options = { ["bem.enabled"] = true } } }
local emmet_ft = {
	"css",
	"pug",
	"vue",
	"html",
	"less",
	"sass",
	"scss",
	"astro",
	"eruby",
	"svelte",
	"htmldjango",
	"htmlangular",
	"javascriptreact",
	"typescriptreact",
}

vim.keymap.set("n", "<leader>se", function()
	require("lspconfig").emmet_ls.setup({
		capabilities = capabilities,
		init_options = emmet_init_options,
		filetypes = emmet_ft,
	})
	print("starting emmet language server")
end)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		keys.lsp_callback_keybindings()
	end,
})

---@see LSPConfig https://github.com/neovim/nvim-lspconfig
local utils = require("utils.lsp")
local expand_keymaps = require("utils.expand").expand_keymaps
local setup_sign_icons = require("utils").setup_sign_icons
local lsp_format_code, list_workspace_folder, lsp_hover, load_lsp_configs =
	utils.lsp_format_code, utils.list_workspace_folder, utils.lsp_hover, utils.load_lsp_configs

local on_attach = function(_, buffer)
	local opts = { noremap = true, silent = true, buffer = buffer }
	expand_keymaps({
		n = {
			["<leader>rs"] = { "<cmd>LspRestart<CR>", "Restart LSP", opts },
			["gR"] = { "<cmd>Telescope lsp_references<CR>", "Show LSP references", opts },
			["gt"] = { "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions", opts },
		},
	})
end

utils.setup_borders()

setup_sign_icons(require("configs.icons").diagnostics, function(t)
	return "DiagnosticSign" .. t
end)

load_lsp_configs(on_attach)

expand_keymaps({
	n = {
		["]d"] = { vim.diagnostic.goto_next, "Next Diagnostic" },
		["[d"] = { vim.diagnostic.goto_prev, "Previous Diagnostic" },
		["<leader>q"] = { vim.diagnostic.setloclist, "Send diagnostics to quickfix list" },
		["<leader>td"] = {
			function()
				vim.diagnostic.enable(false)
			end,
			"Next Diagnostic",
		},
		["<leader>se"] = {
			function()
				utils.load_lsp("emmet_ls", on_attach)
			end,
			"Start emmet server",
		},
	},
})

local lsp_attach_callback = function(ev)
	vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
	expand_keymaps({
		[{ "n", "v" }] = {
			["<leader>ca"] = { vim.lsp.buf.code_action, "Code Action" },
		},
		n = {
			["K"] = { lsp_hover, "LSPHover current text" },
			["gr"] = { vim.lsp.buf.references, "Go to LSP References" },
			["gd"] = { vim.lsp.buf.definition, "Go to LSP Definition" },
			["gD"] = { vim.lsp.buf.declaration, "Go to LSP Declaration" },
			["gi"] = { vim.lsp.buf.implementation, "Go to LSP Definition" },
			["<leader>D"] = { vim.lsp.buf.type_definition, "LSP Type definition" },
			["<leader>rn"] = { vim.lsp.buf.rename, "LSP Rename" },
			["<leader>fa"] = { vim.lsp.buf.add_workspace_folder, "LSP Add workspace folder" },
			["<leader>fr"] = { vim.lsp.buf.remove_workspace_folder, "LSP Remove workspace folder" },
			["<leader>fl"] = { list_workspace_folder, "LSP Add workspace folder" },
			["<leader>fc"] = { lsp_format_code, "Format code" },
		},
	})
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = lsp_attach_callback,
})

require("ufo").setup()

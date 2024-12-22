local M = {}
local utils = require("utils.lsp")
local expand_keymaps = require("utils.expand").expand_keymaps
local lsp_format_code, list_workspace_folder, lsp_hover =
	utils.lsp_format_code, utils.list_workspace_folder, utils.lsp_hover

M.default_lsp_keybindings = function(capabilities, on_attach)
	local load_emmet = function()
		utils.load_lsp("emmet_ls", capabilities, on_attach)
		vim.cmd([[edit!]])
	end
	expand_keymaps({
		n = {
			["]d"] = { vim.diagnostic.goto_next, "Next Diagnostic" },
			["[d"] = { vim.diagnostic.goto_prev, "Previous Diagnostic" },
			["<leader>ee"] = { load_emmet, "Enable emmet server" },
			["<leader>td"] = { utils.disable_diagnostics, "Disable diagnostic" },
			["<leader><leader>q"] = { vim.diagnostic.setloclist, "Send diagnostics to quickfix list" },
		},
	})
end

M.on_attach_keybindings = function(buffer)
	expand_keymaps({
		n = {
			["gt"] = { "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
			["gR"] = { "<cmd>Telescope lsp_references<CR>", "Show LSP references" },
			["<leader>rs"] = { vim.cmd.LspRestart, "Restart LSP" },
		},
	}, { noremap = true, silent = true, buffer = buffer })
end

M.lsp_callback_keybindings = function()
	expand_keymaps({
		[{ "n", "v" }] = { ["<leader>ca"] = { vim.lsp.buf.code_action, "Code Action" } },
		n = {
			["K"] = { lsp_hover, "LSPHover current text" },
			["gr"] = { vim.lsp.buf.references, "Go to LSP References" },
			["gd"] = { vim.lsp.buf.definition, "Go to LSP Definition" },
			["gD"] = { vim.lsp.buf.declaration, "Go to LSP Declaration" },
			["gi"] = { vim.lsp.buf.implementation, "Go to LSP Definition" },
			["<leader>D"] = { vim.lsp.buf.type_definition, "LSP Type definition" },
			["<leader>rn"] = { vim.lsp.buf.rename, "LSP Rename" },
			["<leader>fc"] = { lsp_format_code, "Format code" },
			["<leader>fl"] = { list_workspace_folder, "LSP Add workspace folder" },
			["<leader>fa"] = { vim.lsp.buf.add_workspace_folder, "LSP Add workspace folder" },
			["<leader>fr"] = { vim.lsp.buf.remove_workspace_folder, "LSP Remove workspace folder" },
		},
	})
end

return M

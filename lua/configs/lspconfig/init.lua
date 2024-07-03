---@see LSPConfig https://github.com/neovim/nvim-lspconfig
local create_border = require("utils").border
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

--- add ufo capabilities
capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
--- add emmet completion support
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LSP Border
vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local border = create_border("FloatBorder")

-- LSP settings (for overriding per client)
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- add borders
for key, v in pairs(handlers) do
	vim.lsp.handlers[key] = v
end

vim.diagnostic.config({
	virtual_text = {
		source = "if_many", -- Or "if_many"
	},
	float = {
		border = border,
		source = "if_many",
	},
})

-- Auto show diagnostic
-- vim.o.updatetime = 250
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- 	group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
-- 	end,
-- })

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local on_attach = function(_, bufnr)
	local options = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap

	options.desc = "Show LSP references"
	keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", options)

	options.desc = "Show LSP type definitions"
	keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", options)

	options.desc = "Restart LSP"
	keymap.set("n", "<leader>rs", ":LspRestart<CR>", options)
end

--- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
	"marksman",
	"mdx_analyzer",
	-- web
	"html",
	"htmx",
	"astro",
	"svelte",
	"eslint",
	"cssls",
	"cssmodules_ls",
	-- data
	"sqlls",
	"taplo", --- https://taplo.tamasfe.dev/
	-- systems
	"dockerls",
	"clangd",
	"vimls",
	"cmake",
}

local setup_lsp = function(options)
	return {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = options.settings or options,
		setup = options.setup or nil,
	}
end
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({ on_attach = on_attach, capabilities = capabilities })
end

lspconfig.bashls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "zsh", "sh" },
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = function(c, b)
		on_attach(c, b)
		require("tailwindcss-colors").buf_attach(b)
	end,
})

lspconfig.gopls.setup(setup_lsp(require("configs.lspconfig.gopls")))
lspconfig.cssls.setup(setup_lsp(require("configs.lspconfig.cssls")))
lspconfig.clangd.setup(setup_lsp(require("configs.lspconfig.clangd")))
lspconfig.lua_ls.setup(setup_lsp(require("configs.lspconfig.lua_ls")))
lspconfig.jsonls.setup(setup_lsp(require("configs.lspconfig.jsonls")))
lspconfig.yamlls.setup(setup_lsp(require("configs.lspconfig.yamlls")))
lspconfig.tsserver.setup(setup_lsp(require("configs.lspconfig.tsserver")))
lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	filetypes = {
		"vue",
		"pug",
		"css",
		"less",
		"sass",
		"scss",
		"html",
		"eruby",
		"svelte",
		"markdown",
		"javascript",
		"javascriptreact",
		"typescriptreact",
	},
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>td", vim.diagnostic.disable, { desc = "Hide Diagnostics" })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", function()
			local filetype = vim.bo.filetype
			if vim.tbl_contains({ "vim", "help" }, filetype) then
				vim.cmd("h " .. vim.fn.expand("<cword>"))
			elseif vim.tbl_contains({ "man" }, filetype) then
				vim.cmd("Man " .. vim.fn.expand("<cword>"))
			elseif vim.fn.expand("%:t") == "package.json" then
				print("hello")
			elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
				require("crates").show_popup()
			else
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end
		end, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>fa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>fr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>fl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>fc", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

require("ufo").setup()

-- Setup language servers.
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

local options = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
	local keymap = vim.keymap
	options.buffer = bufnr

	options.desc = "Show LSP references"
	keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", options)

	options.desc = "Go to declaration"
	keymap.set("n", "gD", vim.lsp.buf.declaration, options)

	options.desc = "Show LSP definitions"
	keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", options)

	options.desc = "Show LSP implementations"
	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", options)

	options.desc = "Show LSP type definitions"
	keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", options)

	options.desc = "See available code actions"
	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options)

	options.desc = "Smart rename"
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options)

	options.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", options)

	-- options.desc = "Show line diagnostics"
	-- keymap.set("n", "<leader>d", vim.diagnostic.open_float, options)

	options.desc = "Go to previous diagnostic"
	keymap.set("n", "[d", vim.diagnostic.goto_prev, options)

	options.desc = "Go to next diagnostic"
	keymap.set("n", "]d", vim.diagnostic.goto_next, options)

	options.desc = "Show documentation for what is under cursor"
	keymap.set("n", "K", vim.lsp.buf.hover, options)

	options.desc = "Restart LSP"
	keymap.set("n", "<leader>rs", ":LspRestart<CR>", options)
end

local servers = {
	"bashls",
	"marksman",
	"mdx_analyzer",
	"yamlls",
	"lua_ls",
	"jsonls",
	-- web
	"astro",
	"svelte",
	"html",
	"htmx",
	"cssls",
	"cssmodules_ls",
	"eslint",
	"tsserver",
	"tailwindcss",
	"sqlls",
	-- systems
	"gopls",
	"dockerls",
	"clangd",
	-- c
	"cmake",
}

for _, lsp in ipairs(servers) do
	if lsp == "tailwindcss" then
		lspconfig[lsp].setup({
			capabilities = capabilities,
			on_attach = function(c, b)
				on_attach(c, b)
				require("tailwindcss-colors").buf_attach(b)
			end,
		})
		goto continue
	end
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	::continue::
end

lspconfig.jsonls.setup({
	on_attach = on_attach,
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
			},
		},
	},
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = {
				maxPreload = 100000,
				preloadFileSize = 10000,
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
				},
			},
		},
	},
})
--
lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
	setup = {
		tsserver = function(_, opts)
			require("typescript").setup({ server = opts })
			return true
		end,
		astro = function(_, opts)
			require("astro-language-server").setup({ server = opts })
			return true
		end,
	},
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
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
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>fa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>fr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>fl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>fm", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

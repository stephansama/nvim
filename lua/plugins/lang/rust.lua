local rustaceanvim_opts = function()
	local mason_registry = require("mason-registry")
	local codelldb = mason_registry.get_package("codelldb")
	local extension_path = codelldb:get_install_path() .. "/extension/"
	local codelldb_path = extension_path .. "adapter/codelldb"
	local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
	return {
		server = {
			on_attach = function(client, bufnr)
				require("lsp-inlayhints").on_attach(client, bufnr)
			end,
			---@param project_root string Path to the project root
			settings = function(project_root)
				local ra = require("rustaceanvim.config.server")
				return ra.load_rust_analyzer_settings(project_root, {
					settings_file_pattern = "rust-analyzer.json",
				})
			end,
		},
		dap = {
			adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, liblldb_path),
		},
	}
end

return {
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		event = "BufReadPost",
		ft = { "rust" },
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			vim.g.rustaceanvim = rustaceanvim_opts
		end,
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = true,
	},
}

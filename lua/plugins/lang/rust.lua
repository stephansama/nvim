local border = require("utils").border

local rustaceanvim_opts = function()
	-- local codelldb = mason_registry.get_package("codelldb")
	-- local mason_registry = require("mason-registry")
	local codelldb = vim.fn.stdpath("data") .. "/mason/packages/codelldb"
	local extension_path = codelldb .. "/extension/"
	local codelldb_path = extension_path .. "adapter/codelldb"
	local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
	return {
		server = {
			---@param project_root string Path to the project root
			settings = function(project_root)
				local ra = require("rustaceanvim.config.server")
				return ra.load_rust_analyzer_settings(project_root, {
					settings_file_pattern = "rust-analyzer.json",
				})
			end,
		},
		-- tools = { hover_actions = { replace_builtin_hover = false } },
		dap = { adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, liblldb_path) },
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
		ft = { "rust" },
		event = "BufReadPost",
		version = "^4",
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			vim.g.rustaceanvim = rustaceanvim_opts
		end,
	},
	{
		"saecki/crates.nvim",
		config = true,
		event = { "BufRead Cargo.toml" },
		opts = { --- https://github.com/Saecki/crates.nvim/wiki/Documentation-v0.4.0#config
			popup = { border = border("FloatBorder") },
		},
		keys = {
			{ "<leader>cs", "<cmd>Crates show_popup<cr>", desc = "Crates.nvim open features list" },
			{ "<leader>cu", "<cmd>Crates update_crate<cr>", desc = "Crates.nvim update crate" },
			{ "<leader>cu", "<cmd>Crates update_crates<cr>", desc = "Crates.nvim update crates", mode = "v" },
			{ "<leader>ch", "<cmd>Crates open_homepage<cr>", desc = "Crates.nvim open homepage" },
			{ "<leader>cc", "<cmd>Crates open_cratesio<cr>", desc = "Crates.nvim open crates.io" },
			{ "<leader>cr", "<cmd>Crates open_repository<cr>", desc = "Crates.nvim open repository" },
			{ "<leader>cd", "<cmd>Crates open_documentation<cr>", desc = "Crates.nvim open docs.rs" },
			{ "<leader>cf", "<cmd>Crates show_features_popup<cr>", desc = "Crates.nvim open features list" },
			{ "<leader>ce", "<cmd>Crates show_dependencies_popup<cr>", desc = "Crates.nvim open dependencies list" },
		},
	},
}

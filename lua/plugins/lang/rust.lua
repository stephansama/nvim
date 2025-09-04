vim.g.rustaceanvim = function()
	local codelldb = vim.fn.stdpath("data") .. "/mason/packages/codelldb/"
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
			default_settings = {
				["rust-analyzer"] = {
					files = { excludeDirs = "node_modules/**" },
				},
			},
		},
		dap = {
			adapter = require(
				"rustaceanvim.config"
			).get_codelldb_adapter(codelldb_path, liblldb_path),
		},
	}
end

return { {
	"rust-lang/rust.vim",
	ft = "rust",
	lazy = true,
	init = function()
		vim.g.rustfmt_autosave = 1
	end,
}, {
	"mrcjkb/rustaceanvim",
	ft = { "rust" },
	version = "^4",
	dependencies = "neovim/nvim-lspconfig",
}, {
	"saecki/crates.nvim",
	config = true,
	event = { "BufRead Cargo.toml" },
	--- https://github.com/Saecki/crates.nvim/wiki/Documentation-v0.4.0#config
	opts = {
		popup = { border = require("utils.ui").border("FloatBorder") },
	},
	keys = require("keys.plugin").crates,
} }

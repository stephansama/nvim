if not vim.tbl_contains(require("lang.enabled").enabled, "rust") then return end

vim.g.rustfmt_autosave = 1
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

vim.pack.add({ { src = "https://github.com/rust-lang/rust.vim" }, {
	src = "https://github.com/mrcjkb/rustaceanvim",
	version = vim.version.range("^9"),
}, { src = "https://github.com/saecki/crates.nvim" } })

require("crates").setup({
	popup = { border = require("utils").border("FloatBorder") },
})

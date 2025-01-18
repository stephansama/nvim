local M = {}

M.HOME = os.getenv("HOME")
M.NVIM_APPNAME = (os.getenv("NVIM_APPNAME") or "nvim")

M.DATA = vim.fn.stdpath("data")

M.LAZY_DIR = M.DATA .. "/lazy/lazy.nvim"

M.NVIM_CONFIG_DIR = M.HOME .. "/.config/" .. M.NVIM_APPNAME
M.TREESITTER_PARSER_INSTALL_DIR = M.HOME .. "/.local/share/treesitter"

M.SNIPPETS_DIR = "./snippets/"
M.ASCII_DIR = M.NVIM_CONFIG_DIR .. "/images/"
M.LSP_CONFIG_DIR = M.NVIM_CONFIG_DIR .. "/lua/servers/"
M.PLUGIN_LANG_DIR = M.NVIM_CONFIG_DIR .. "/lua/plugins/lang/"

M.MASON_PACKAGES = M.DATA .. "/mason/packages/"

M.CODELLDB_EXTENSION_PATH = M.MASON_PACKAGES .. "codelldb/extension/"
M.CODELLDB_PATH = M.CODELLDB_EXTENSION_PATH .. "adapter/codelldb"
M.LIBLLDB_PATH = M.CODELLDB_EXTENSION_PATH .. "lldb/lib/liblldb.dylib"

return M

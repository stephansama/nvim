local M = {}

M.HOME = os.getenv("HOME")

M.DATA = vim.fn.stdpath("data")

M.LAZY_DIR = M.DATA .. "/lazy/lazy.nvim"

M.NVIM_CONFIG_DIR = M.HOME .. "/.config/nvim"
M.TREESITTER_PARSER_INSTALL_DIR = M.HOME .. "/.local/share/treesitter"

M.SNIPPETS_DIR = "./snippets/"
M.ASCII_DIR = M.NVIM_CONFIG_DIR .. "/images/"
M.LSP_CONFIG_DIR = M.NVIM_CONFIG_DIR .. "/lua/configs/lspconfig/"

M.MASON_PACKAGES = M.DATA .. "/mason/packages/"

M.CODELLDB_EXTENSION_PATH = M.MASON_PACKAGES .. "codelldb/extension/"
M.CODELLDB_PATH = M.CODELLDB_EXTENSION_PATH .. "adapter/codelldb"
M.LIBLLDB_PATH = M.CODELLDB_EXTENSION_PATH .. "lldb/lib/liblldb.dylib"

return M

local M = {}

M.HOME = os.getenv("HOME")

M.LAZY_DIR = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

M.NVIM_CONFIG_DIR = M.HOME .. "/.config/nvim"
M.TREESITTER_PARSER_INSTALL_DIR = M.HOME .. "/.local/share/treesitter"

M.SNIPPETS_DIR = "./snippets/"
M.ASCII_DIR = M.NVIM_CONFIG_DIR .. "/images/"

return M

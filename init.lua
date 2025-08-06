require("srandle")

---> autocmd to underline all links <---
vim.cmd([[autocmd BufEnter * match Underlined /https\?:\/\/\S\+/]])

if not vim.tbl_contains(require("lang.enabled").enabled, "data") then return end

vim.pack.add({ { src = "https://github.com/b0o/schemastore.nvim" } })

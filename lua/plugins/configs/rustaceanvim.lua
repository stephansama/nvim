vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      require("lsp-inlayhints").on_attach(client, bufnr)
      -- on_attach(client, bufnr)
    end,
    -- capabilities = capabilities,
  },
}


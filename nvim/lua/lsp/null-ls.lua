local on_attach = require('lsp.on_attach')
local null_ls = require("null-ls")

null_ls.config({
    sources = { null_ls.builtins.formatting.eslint_d, null_ls.builtins.formatting.prettierd }
})

require("lspconfig")["null-ls"].setup({
    on_attach = on_attach
})

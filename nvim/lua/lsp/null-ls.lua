local on_attach = require('lsp.on_attach')
local null_ls = require("null-ls")

null_ls.setup({
    sources = { null_ls.builtins.formatting.eslint_d, null_ls.builtins.formatting.prettierd },
    on_attach = on_attach,
})


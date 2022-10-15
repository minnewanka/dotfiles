local on_attach = require('lsp.on_attach')
local null_ls = require("null-ls")

null_ls.setup({
    sources = { 
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua
    },
    on_attach = on_attach
})


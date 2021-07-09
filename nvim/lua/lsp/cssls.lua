local on_attach = require('lsp.on_attach')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;


require'lspconfig'.cssls.setup {
    -- filetypes = { "css", "scss", "less","typescriptreact" },
    on_attach = function(client)
        capabilities = capabilities
        on_attach(client)
    end
}

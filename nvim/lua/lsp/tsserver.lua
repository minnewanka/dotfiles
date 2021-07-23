local on_attach = require('lsp.on_attach')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup({
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    capabilities = capabilities
    on_attach(client)
  end
})


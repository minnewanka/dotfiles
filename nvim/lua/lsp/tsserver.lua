local on_attach = require('lsp.on_attach')
local util = require 'lspconfig/util'
local root_pattern = util.root_pattern
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup({
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    on_attach = function(client)
    client.server_capabilities.document_formatting = false
    capabilities = capabilities
    on_attach(client)
  end
})

require'lspconfig'.jsonls.setup {
    on_attach = function(client)
        client.server_capabilities.textDocument.documentSymbol = false
        capabilities = capabilities
        on_attach(client)
    end,
    settings = {
        json = {
            schemas = {
                {
                    fileMatch = { 'package.json' },
                    url = 'https://json.schemastore.org/package.json',
                },
                {
                    fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
                    url = 'http://json.schemastore.org/tsconfig',
                },
            },
        },
    },
}


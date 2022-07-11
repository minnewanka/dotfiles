local on_attach = require('lsp.on_attach')
local util = require 'lspconfig/util'
local root_pattern = util.root_pattern
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- npm install -g typescript typescript-language-server
--[[ require'lspconfig'.tsserver.setup({
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    on_attach =  on_attach,
    capabilities = capabilities
}) ]]

require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    server = { -- pass options to lspconfig's setup method
        on_attach =  on_attach,
    },
})

require'lspconfig'.jsonls.setup {
    on_attach =  on_attach,
    capabilities = capabilities,
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


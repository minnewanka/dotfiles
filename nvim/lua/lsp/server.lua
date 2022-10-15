local on_attach = require('lsp.on_attach')
local util = require 'lspconfig/util'
local root_pattern = util.root_pattern
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    server = { -- pass options to lspconfig's setup method
        on_attach =  on_attach,
    },
})

require'lspconfig'.emmet_ls.setup({
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    init_options = {
      html = {
        options = {
          ["bem.enabled"] = true,
        },
      },
    }
})

require'lspconfig'.html.setup{
     capabilities = capabilities,
}

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

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


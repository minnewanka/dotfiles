vim.cmd ("let g:loaded_zipPlugin = 1")
vim.cmd ("let g:loaded_zip = 1")

vim.g.SignatureMarkTextHL = 'Blue'
require('plugins')
require('settings')

require('keybinding')

require('lsp/config')

require('lsp/efm')
require('lsp/tsserver')

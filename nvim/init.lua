vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0
vim.g.SignatureMarkTextHL = 'Blue'

require('colorscheme')
require('plugins')
require('settings')

require('keybinding')

require('lsp/config')
require('lsp/efm')
require('lsp/tsserver')

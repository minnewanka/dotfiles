require('impatient')
vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' };
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0
vim.g.SignatureMarkTextHL = 'Blue'

require('colorscheme')
require('plugins')
require('settings')
require('keybinding')


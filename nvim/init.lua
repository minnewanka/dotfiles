vim.g.cursorhold_updatetime = 100
vim.g.copilot_filetypes = {
    ['*'] = false,
    ['javascript'] = true,
    ['typescript'] = true,
    ['lua'] = true,
    ['html'] = true,
}


require('impatient')
require('plugins')
require('settings')
require('keybinding')
require('colorscheme')




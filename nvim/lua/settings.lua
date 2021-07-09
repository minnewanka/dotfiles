vim.cmd('set shortmess+=c')
vim.cmd('syntax on')
vim.cmd('set foldmethod=expr')
vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')

vim.opt.number                    =       true
vim.opt.relativenumber            =       true
vim.opt.cursorline                =       true
vim.opt.expandtab                 =       true
vim.opt.expandtab                 =       true
vim.opt.termguicolors             =       true
vim.opt.mouse                     =       "a"
vim.opt.splitbelow                =       true
vim.opt.splitright                =       true
vim.opt.fileencoding              =       "utf-8"
vim.opt.showmode                  =       false
vim.opt.backup                    =       false
vim.opt.timeout                   =       true
vim.opt.timeoutlen                =       300
vim.opt.ruler                     =       true
vim.opt.hidden                    =       true
vim.opt.smarttab                  =       true
vim.opt.smartindent               =       true
vim.opt.shiftwidth                =       4
vim.opt.shiftwidth                =       4
vim.opt.tabstop                   =       4
vim.opt.tabstop                   =       4
vim.opt.softtabstop               =       4
vim.opt.softtabstop               =       4
vim.opt.errorbells                =       false
vim.opt.ruler                     =       true
vim.opt.wrap                      =       false
vim.opt.smartcase                 =       true
vim.opt.ignorecase                =       true
vim.opt.undofile                  =       true
vim.opt.hlsearch                  =       true
vim.opt.incsearch                 =       true
vim.opt.showmatch                 =       false
vim.opt.swapfile                  =       false
vim.opt.updatetime                =       300
vim.opt.signcolumn                =       "yes:1"
vim.opt.autoindent                =       true
vim.opt.scrolloff                 =       10
vim.opt.formatoptions             =       vim.opt.formatoptions +{ "cro" }
vim.o.foldenable                  =       false

-- Highlight on yank
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank{higroup="YankHighlight", timeout=700}'

--  TrimWhitespace
vim.api.nvim_exec([[
    fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun
    autocmd BufWritePre * :call TrimWhitespace()
]], false)

vim.api.nvim_exec([[
autocmd BufWinEnter * set  formatoptions-=cro
]], false)

vim.api.nvim_exec([[
augroup FugitiveCustom
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
]], false)

vim.api.nvim_exec([[
function! ClearQuickfixList()
  call setqflist([])
endfunction
command! ClearQuickfixList call ClearQuickfixList()
]], false)

vim.api.nvim_exec([[
    command! BufOnly silent! execute "%bd|e#|bd#"
    command! TSFix :write | edit | TSBufEnable highlight
]], false)

vim.api.nvim_exec([[
function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Git
    endif
endfunction
command ToggleGStatus :call ToggleGStatus()
]], false)

vim.api.nvim_exec([[
au BufReadPost *.fish set filetype=fish
]], false)




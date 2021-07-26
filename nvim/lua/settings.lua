vim.cmd ("set inccommand=split")

vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_palette = 'mix'
vim.g.gruvbox_material_visual = 'blue background'
-- vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_better_performance = 1
vim.cmd 'colorscheme gruv'
vim.g.tokyonight_transparent = true

vim.opt.number                    =       true
vim.opt.relativenumber            =       true
vim.opt.cursorline                =       true
vim.opt.expandtab                 =       true
vim.opt.termguicolors             =       true
vim.opt.mouse                     =       "a"
vim.opt.splitbelow                =       true
vim.opt.splitright                =       true
vim.opt.fileencoding              =       "utf-8"
vim.opt.showmode                  =       false
vim.opt.timeout                   =       true
vim.opt.timeoutlen                =       300
vim.opt.hidden                    =       true
vim.opt.smartindent               =       true
vim.opt.shiftwidth                =       4
vim.opt.tabstop                   =       4
vim.opt.softtabstop               =       4
vim.opt.smartcase                 =       true
vim.opt.ignorecase                =       true
vim.opt.undofile                  =       true
vim.opt.updatetime                =       300
vim.opt.signcolumn                =       "yes:1"
vim.opt.scrolloff                 =       10
vim.opt.formatoptions             =       vim.opt.formatoptions +{ "cro" }
vim.opt.shortmess:append "c"
vim.opt.swapfile                  =       false
vim.opt.statusline='%f  %m%r%h%w%=[%l,%v]      [%L,%p%%] %n'



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


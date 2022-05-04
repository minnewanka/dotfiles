local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local nvim_exec = vim.api.nvim_exec
local fn, cmd = vim.fn, vim.cmd

cmd ("set inccommand=split")
cmd ("set noshowmode")
cmd ("set grepprg=rg\\ --vimgrep\\ --no-heading\\ --smart-case")
cmd ("set grepformat=%f:%l:%c:%m")
cmd ("set clipboard=unnamedplus")

opt.autowriteall              =       true
opt.number                    =       true
opt.relativenumber            =       true
opt.cursorline                =       true
opt.expandtab                 =       true
opt.termguicolors             =       true
opt.mouse                     =       "a"
opt.splitbelow                =       true
opt.splitright                =       true
opt.fileencoding              =       "utf-8"
opt.timeout                   =       true
opt.timeoutlen                =       300
opt.smartindent               =       true
opt.shiftwidth                =       4
opt.tabstop                   =       4
opt.softtabstop               =       4
opt.smartcase                 =       true
opt.ignorecase                =       true
opt.undofile                  =       true
opt.updatetime                =       300
opt.signcolumn                =       "yes:1"
opt.scrolloff                 =       10
opt.formatoptions             =       vim.opt.formatoptions + { "cro" }
opt.shortmess:append "c"
opt.swapfile                  =       false
opt.lazyredraw                =       true
vim.opt.shell                 =       "/bin/bash"
opt.laststatus                =       3

-- don't load the plugins below
g.loaded_gzip                 =       1
g.loaded_tar                  =       1
g.loaded_tarPlugin            =       1
g.loaded_zipPlugin            =       1
g.loaded_2html_plugin         =       1
g.loaded_netrwPlugin          =       1

-- Highlight on yank
cmd 'au TextYankPost * silent! lua vim.highlight.on_yank{higroup="YankHighlight", timeout=700}'

nvim_exec([[
autocmd BufWinEnter * set  formatoptions-=cro
]], false)

nvim_exec([[
    command! BufOnly silent! execute "%bd|e#|bd#"
    command! TSFix :write | edit | TSBufEnable highlight
]], false)


nvim_exec([[
function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Git
    endif
endfunction

command ToggleGStatus :call ToggleGStatus()
]], false)


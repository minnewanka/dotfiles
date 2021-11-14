local cmd = vim.cm
local opt = vim.opt
local g = vim.g
local nvim_exec = vim.api.nvim_exec
local fn, cmd = vim.fn, vim.cmd

cmd ("set title")
cmd ("set titlestring=\\ %-25.55f\\ %a%r%m titlelen=70")
cmd ("set inccommand=split")
cmd ("set grepprg=rg\\ --vimgrep\\ --no-heading\\ --smart-case")
cmd ("set grepformat=%f:%l:%c:%m")

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
opt.hidden                    =       true
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
vim.opt.shell = "/bin/bash"
opt.laststatus=2

-- don't load the plugins below
g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zipPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_netrwPlugin = 1

-- Highlight on yank
cmd 'au TextYankPost * silent! lua vim.highlight.on_yank{higroup="YankHighlight", timeout=700}'

--  TrimWhitespace
nvim_exec([[
    fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun
    autocmd BufWritePre * :call TrimWhitespace()
]], false)

nvim_exec([[
autocmd BufWinEnter * set  formatoptions-=cro
]], false)

nvim_exec([[
autocmd FocusLost,InsertLeave * wa
autocmd WinNew * lua win=vim.api.nvim_get_current_win() vim.defer_fn(function()vim.api.nvim_set_current_win(win) end, 200)
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

-- show cursor line only in active window
 cmd([[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]])

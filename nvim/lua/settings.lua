local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local nvim_exec = vim.api.nvim_exec
local fn, cmd = vim.fn, vim.cmd

cmd ("set nomodeline")
cmd ("set inccommand=split")
cmd ("set noshowmode")
cmd ("set grepprg=rg\\ --vimgrep\\ --no-heading\\ --smart-case")
cmd ("set grepformat=%f:%l:%c:%m")
cmd ("set clipboard=unnamedplus")
cmd (" set statusline=%<\\ %{FugitiveStatusline()}%=%-14.(%l,%c%V%)\\ %P")

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
opt.scrolloff                 =       10
opt.formatoptions             =       vim.opt.formatoptions + { "cro" }
opt.shortmess:append "c"
opt.swapfile                  =       false
opt.lazyredraw                =       true
vim.opt.shell                 =       "/bin/bash"
opt.laststatus                =       2
vim.o.winbar = "%{%v:lua.require'modules.ui.winbar'.eval()%}"
opt.fillchars:append { eob = " " }
vim.opt.signcolumn = 'yes'

-- don't load the plugins below
g.loaded_gzip                 =       1
g.loaded_tar                  =       1
g.loaded_tarPlugin            =       1
g.loaded_zipPlugin            =       1
g.loaded_2html_plugin         =       1
g.loaded_netrwPlugin          =       1


vim.api.nvim_create_autocmd({"TextYankPost"}, {
  pattern = "*",
  command = 'silent! lua vim.highlight.on_yank{higroup="YankHighlight", timeout=700}',
})

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = "*",
  command = 'set formatoptions-=cro',
})

vim.api.nvim_create_autocmd({"WinEnter"}, {
  command = 'setlocal cursorline',
})
vim.api.nvim_create_autocmd({"WinLeave"}, {
  command = 'setlocal nocursorline',
})

vim.api.nvim_create_autocmd({"InsertEnter"}, {
  command = 'highlight CursorLine guibg=#374141',
})
vim.api.nvim_create_autocmd({"InsertLeave"}, {
  command = 'highlight CursorLine guibg=#32302f',
})

vim.api.nvim_create_user_command("BufOnly", 'silent! execute "%bd|e#|bd#"',{})
vim.api.nvim_create_user_command("TSFix", ':write | edit | TSBufEnable highlight',{})


vim.api.nvim_create_user_command(
    'ToggleGStatus',
    function()
        if vim.fn.buflisted(vim.fn.bufname('.git/index')) ~= 0
        then vim.cmd("bd .git/index")
        else
            vim.cmd("Git")
        end
    end,
    {}
)

-- command abbreviation
cmd ("command PI PackerInstall")
cmd ("command PU PackerUpdate")
cmd ("command PC PackerCompile")


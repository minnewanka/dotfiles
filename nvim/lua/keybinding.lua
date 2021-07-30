vim.g.mapleader = ' '

--source file
vim.api.nvim_set_keymap('n', '<leader>r', ':source %<CR>', { noremap = true, silent = false })


-- remap macro
vim.api.nvim_set_keymap('n', 'Q', 'q', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'q', '<NOP>', { noremap = true, silent = true })

-- selection
vim.api.nvim_set_keymap('i', '<C-j>', '<C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-p>', { noremap = true })

vim.api.nvim_set_keymap('c', '<C-k>', 'pumvisible() ? "<C-p>" : "<Up>"', { noremap = true, expr = true, silent = false})
vim.api.nvim_set_keymap('c', '<C-j>', 'pumvisible() ? "<C-n>" : "<Down>"', { noremap = true, expr = true, silent = false})

-- paste
vim.api.nvim_set_keymap('v', '<leader>p', '"_dP', { noremap = true, silent = true })

-- yank
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>y', '"*y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>y', '"*y', { noremap = true, silent = true })

-- hlsearch
vim.api.nvim_set_keymap('n', 'ghl', ':set hlsearch! hlsearch?<CR>', { noremap = true, silent = true })

-- save & quit
vim.api.nvim_set_keymap('n', '<Leader>q', ':q!<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>z', ':wq<CR>', { noremap = true, silent = true })

-- remap esc
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true, silent = true})

-- quickfix & local list
vim.api.nvim_set_keymap('n', ';l', ':copen<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';q', ':cclose<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';n', ':cn<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';p', ':cp<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>T', ':lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';ll', ':lopen<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';ln', ':lnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ';lp', ':lprev<CR>', {noremap = true, silent = true})

-- delete current buffer
vim.api.nvim_set_keymap('n', '<leader><BS>', ':Bdelete<CR>', {noremap = true, silent = true})

-- tab
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnew %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>to', ':tabonly<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tq', ':tabclose<CR>', { noremap = true, silent = true })

-- line text object
vim.api.nvim_set_keymap('x', 'il', 'g_o^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'il', ':normal vil<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'al', '$o0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'al', ':normal val<CR>', { noremap = true, silent = true })

-- LSP
vim.api.nvim_set_keymap('n', '<Leader><Leader>',  [[<Cmd>lua vim.lsp.buf.formatting()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd',  [[<Cmd>lua vim.lsp.buf.definition()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gu',  [[<Cmd>lua vim.lsp.buf.implementation()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",  {silent = true, noremap = true})

-- word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

-- git diff
vim.api.nvim_set_keymap('n', '<Leader>g',  ':ToggleGStatus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';g',  ':ToggleGStatus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gd',  ':Gdiffsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gD',  ':Git difftool<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>g;', ':diffget //3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gj', ':diffget //2<CR>', { noremap = true, silent = true })

-- Tab
vim.api.nvim_set_keymap('i', '<TAB>', "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump':'<Tab>'", { expr = true, silent = true})

-- reselect map
vim.api.nvim_set_keymap('n', 'gy', "'`[' . strpart(getregtype(), 0, 1) . '`]'", { noremap = true ,expr = true, silent = true})

--marks
vim.api.nvim_set_keymap('n', '`', '\'', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '\'', '`', {noremap = true, silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<C-P>',  [[<Cmd>Telescope git_files<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b',  [[<Cmd>Telescope buffers<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f',  [[<Cmd>Telescope live_grep<CR>]], { noremap = true, silent = true })

-- serminal
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

--undo break point
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', { noremap = true, silent = true })


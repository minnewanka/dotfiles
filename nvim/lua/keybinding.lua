vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

--source file
map('n', '<leader>r', ':source %<CR>', { noremap = true, silent = false })


-- remap macro
map('n', 'Q', 'q', { noremap = true, silent = true })
map('n', 'q', '<NOP>', { noremap = true, silent = true })

-- selection
map('i', '<C-j>', '<C-n>', { noremap = true, silent = true })
map('i', '<C-k>', '<C-p>', { noremap = true })

map('c', '<C-k>', 'pumvisible() ? "<C-p>" : "<Up>"', { noremap = true, expr = true, silent = false})
map('c', '<C-j>', 'pumvisible() ? "<C-n>" : "<Down>"', { noremap = true, expr = true, silent = false})

-- paste
map('v', '<leader>p', '"_dP', { noremap = true, silent = true })

-- yank
map('n', 'Y', 'y$', { noremap = true, silent = true })
map('n', '<Leader>y', '"*y', { noremap = true, silent = true })
map('v', '<Leader>y', '"*y', { noremap = true, silent = true })

-- hlsearch
map('n', 'ghl', ':set hlsearch! hlsearch?<CR>', { noremap = true, silent = true })

-- save & quit
map('n', '<Leader>q', ':q!<CR>', { noremap = true, silent = false })
map('n', '<Leader>z', ':wq<CR>', { noremap = true, silent = true })

-- remap esc
map('i', 'jk', '<ESC>', {noremap = true, silent = true})
map('i', 'kj', '<ESC>', {noremap = true, silent = true})

-- quickfix & local list
map('n', ';l', ':copen<CR>', {noremap = true, silent = true})
map('n', ';q', ':cclose<CR>', {noremap = true, silent = true})
map('n', ';n', ':cn<CR>', {noremap = true, silent = true})
map('n', ';p', ':cp<CR>', {noremap = true, silent = true})

map('n', '<leader>T', ':lua vim.lsp.diagnostic.set_loclist()<CR>', {noremap = true, silent = true})
map('n', ';ll', ':lopen<CR>', {noremap = true, silent = true})
map('n', ';ln', ':lnext<CR>', {noremap = true, silent = true})
map('n', ';lp', ':lprev<CR>', {noremap = true, silent = true})

-- delete current buffer
map('n', '<leader><BS>', ':Bdelete<CR>', {noremap = true, silent = true})

-- tab
map('n', '<leader>tn', ':tabnew %<CR>', { noremap = true, silent = true })
map('n', '<leader>to', ':tabonly<CR>', { noremap = true, silent = true })
map('n', '<leader>tq', ':tabclose<CR>', { noremap = true, silent = true })

-- line text object
map('x', 'il', 'g_o^', { noremap = true, silent = true })
map('o', 'il', ':normal vil<CR>', { noremap = true, silent = true })
map('x', 'al', '$o0', { noremap = true, silent = true })
map('o', 'al', ':normal val<CR>', { noremap = true, silent = true })

-- LSP
map('n', '<Leader><Leader>',  [[<Cmd>lua vim.lsp.buf.formatting()<CR>]], { noremap = true, silent = true })
map('n', 'gd',  [[<Cmd>lua vim.lsp.buf.definition()<CR>]], { noremap = true, silent = true })
map('n', 'gu',  [[<Cmd>lua vim.lsp.buf.implementation()<CR>]], { noremap = true, silent = true })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",  {silent = true, noremap = true})

-- word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

-- git diff
map('n', '<Leader>g',  ':ToggleGStatus<CR>', { noremap = true, silent = true })
map('n', ';g',  ':ToggleGStatus<CR>', { noremap = true, silent = true })
map('n', '<Leader>gd',  ':Gdiffsplit<CR>', { noremap = true, silent = true })
map('n', '<Leader>gD',  ':Git difftool<CR>', { noremap = true, silent = true })
map('n', '<Leader>g;', ':diffget //3<CR>', { noremap = true, silent = true })
map('n', '<Leader>gj', ':diffget //2<CR>', { noremap = true, silent = true })

-- Tab
map('i', '<TAB>', "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump':'<Tab>'", { expr = true, silent = true})

-- reselect map
map('n', 'gy', "'`[' . strpart(getregtype(), 0, 1) . '`]'", { noremap = true ,expr = true, silent = true})

--marks
map('n', '`', '\'', {noremap = true, silent = true})
map('n', '\'', '`', {noremap = true, silent = true})

-- Telescope
map('n', '<C-P>',  [[<Cmd>Telescope git_files<CR>]], { noremap = true, silent = true })
map('n', '<Leader>b',  [[<Cmd>Telescope buffers<CR>]], { noremap = true, silent = true })
map('n', '<Leader>f',  [[<Cmd>Telescope live_grep<CR>]], { noremap = true, silent = true })

-- serminal
map('t', 'jk', '<C-\\><C-n>', { noremap = true, silent = true })
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
map('t', '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true, silent = true })
map('t', '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true, silent = true })
map('t', '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true, silent = true })
map('t', '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true, silent = true })

map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

--undo break point
map('i', ',', ',<c-g>u', { noremap = true, silent = true })
map('i', '.', '.<c-g>u', { noremap = true, silent = true })
map('i', '!', '!<c-g>u', { noremap = true, silent = true })
map('i', '?', '?<c-g>u', { noremap = true, silent = true })


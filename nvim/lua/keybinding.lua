vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap


--remap toggle file
map('n', '<BS>', '<C-^>', { noremap = true, silent = true })

map('n', 'Q', 'q', { noremap = true, silent = true })

-- selection
map('i', '<C-j>', '<C-n>', { noremap = true, silent = true })
map('i', '<C-k>', '<C-p>', { noremap = true })

map('c', '<C-k>', 'pumvisible() ? "<C-p>" : "<C-k>"', { noremap = true, expr = true, silent = false})
map('c', '<C-j>', 'pumvisible() ? "<C-n>" : "<C-j>"', { noremap = true, expr = true, silent = false})
map('c', '<Up>', 'pumvisible() ? "<C-p>" : "<Up>"', { noremap = true, expr = true, silent = false})
map('c', '<Down>', 'pumvisible() ? "<C-n>" : "<Down>"', { noremap = true, expr = true, silent = false})

-- paste
map('v', '<leader>p', '"_dP', { noremap = true, silent = true })

-- yank
-- map('n', 'Y', 'y$', { noremap = true, silent = true })
map('n', '<Leader>y', '"*y', { noremap = true, silent = true })
map('v', '<Leader>y', '"*y', { noremap = true, silent = true })

-- hlsearch
map('n', 'ghl', ':noh<CR>', { noremap = true, silent = true })

-- save & quit
map('n', '<Leader>w', ':qa!<CR>', { noremap = true, silent = false })
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


-- line text object
map('x', 'il', 'g_o^', { noremap = true, silent = true })
map('o', 'il', ':normal vil<CR>', { noremap = true, silent = true })
map('x', 'al', '$o0', { noremap = true, silent = true })
map('o', 'al', ':normal val<CR>', { noremap = true, silent = true })

-- word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

-- git diff
-- map('n', '<Leader>g',  ':ToggleGStatus<CR>', { noremap = true, silent = true })
map('n', ';g',  ':ToggleGStatus<CR>', { noremap = true, silent = true })
map('n', '<leader>g',  ':LazyGit<CR>', { noremap = true, silent = true })
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
map('n', '<C-P>',  [[<Cmd>Telescope find_files<CR>]], { noremap = true, silent = true })
map('n', '<leader>M',  [[<Cmd>Telescope marks<CR>]], { noremap = true, silent = true })
map('n', '<Leader>b',  [[<Cmd>Telescope buffers initial_mode=normal<CR>]], { noremap = true, silent = true })
map('n', '<Leader>f',  [[<Cmd>Telescope live_grep<CR>]], { noremap = true, silent = true })
map('n', '<Leader>F',  [[<Cmd>lua require("telescope").extensions.live_grep_raw.live_grep_raw()<CR>]], { noremap = true, silent = true })
map('n', '<leader>cc',[[<Cmd>lua require("telescope").extensions.neoclip.default()<CR>]], { noremap = true, silent = true })
map('n', '<leader>o',  [[<Cmd>Telescope find_files<CR>]], { noremap = true, silent = true })

--undo break point
map('i', ',', ',<c-g>u', { noremap = true, silent = true })
map('i', '.', '.<c-g>u', { noremap = true, silent = true })
map('i', '!', '!<c-g>u', { noremap = true, silent = true })
map('i', '?', '?<c-g>u', { noremap = true, silent = true })

map('n', '<F1>', ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
map('n', '<F2>', ':lua require"dap".continue()<CR>', { noremap = true })

map('n', '<leader>j', ':vertical resize -5<CR>', { noremap = true, silent = true })
map('n', '<leader>k', ':vertical resize +5<CR>', { noremap = true, silent = true })


-- HlsLens
map('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
map('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
map('n', '*', "*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
map('n', '#', "#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
map('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
map('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })


map('n', '<Left>',":lua require('plugins.bufjump').backward()<CR>", { noremap = true, silent = true })
map('n', '<Right>',":lua require('plugins.bufjump').forward()<CR>", { noremap = true , silent = true})


--  Center stuff
map('n', 'n', 'nzz', { noremap = true, silent = true })
map('n', 'N', 'Nzz', { noremap = true, silent = true })
map('n', '*', '*zz', { noremap = true, silent = true })
map('n', '#', '#zz', { noremap = true, silent = true })

map('n', '<leader>m', "<cmd>MarksQFListBuf<cr>", { silent = true})
map('n', '<leader>M', "<cmd>MarksQFListGlobal<cr>", { silent = true})

map('n', 'gb', "<cmd>ScrollbarToggle<cr>", { silent = true})

--Trouble
map("n", "<leader>d", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)

-- tab
map('n', '<leader>tn', ':tabnew %<CR>', { noremap = true, silent = true })
map('n', '<leader>to', ':tabonly<CR>', { noremap = true, silent = true })
map('n', '<leader>tq', ':tabclose<CR>', { noremap = true, silent = true })

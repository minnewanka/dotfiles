require('spectre').setup()
vim.api.nvim_set_keymap('n', '<Leader>s',  [[<Cmd>lua require('spectre').open()<CR>]], { noremap = true, silent = true })

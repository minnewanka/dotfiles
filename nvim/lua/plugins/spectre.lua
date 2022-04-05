require('spectre').setup({
    mapping={
        ['send_to_qf'] = {
            map = "<C-q>",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all item to quickfix"
        },
    }
})
vim.api.nvim_set_keymap('n', '<Leader>s',  [[<Cmd>lua require('spectre').open()<CR>]], { noremap = true, silent = true })

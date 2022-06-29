local saga = require("lspsaga")

saga.init_lsp_saga({
     move_in_saga = { prev = 'k',next = 'j'},
    code_action_lightbulb = {
        enable = false,
        sign = false,
        sign_priority = 20,
        virtual_text = true,
    },
     finder_action_keys = {
        open = "<CR>",
        vsplit = "v",
        split = "s",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>", -- quit can be a table
    },
    symbol_in_winbar = true,
    winbar_separator = ' > ',
    winbar_show_file = true
})

vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true,noremap = true})
vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", { silent = true,noremap = true})
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true,noremap = true })
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true,noremap = true })
vim.api.nvim_set_keymap('n', 'gr',  [[<Cmd>Lspsaga rename<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true,noremap = true })
vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true,noremap= true })

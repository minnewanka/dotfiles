local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_window_picker_chars ='asdfjkl'
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0
vim.g.nvim_tree_width = 55
vim.g.nvim_tree_indent_markers = 1

-- mapping
vim.g.nvim_tree_bindings = {
 { key = "<C-g>",    cb = tree_cb("cd") },
}

vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})


local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup({
    view = {
        width = 55,
        mapping = {
            { key = "<C-g>",    cb = tree_cb("cd") },
        }
    },
})

vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_gitignore = 0
vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
}
vim.g.nvim_tree_window_picker_chars ='asdfjkl'
vim.g.nvim_tree_indent_markers = 1
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})



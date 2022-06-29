local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup({
    update_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        update_cwd = true,
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    git = {
        ignore = false
      },
    view = {
        width = 55,
        mappings = {
            custom_only = true,
            list = {
            { key = "<C-g>",    cb = tree_cb("cd")},
            { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
            { key = "<C-e>",                        action = "edit_in_place" },
            { key = {"O"},                          action = "edit_no_picker" },
            { key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
            { key = "<C-v>",                        action = "vsplit" },
            { key = "<C-x>",                        action = "split" },
            { key = "<C-t>",                        action = "tabnew" },
            { key = "<",                            action = "prev_sibling" },
            { key = ">",                            action = "next_sibling" },
            { key = "P",                            action = "parent_node" },
            { key = "<BS>",                         action = "close_node" },
            { key = "<Tab>",                        action = "preview" },
            { key = "K",                            action = "first_sibling" },
            { key = "J",                            action = "last_sibling" },
            { key = "I",                            action = "toggle_ignored" },
            { key = "H",                            action = "toggle_dotfiles" },
            { key = "R",                            action = "refresh" },
            { key = "a",                            action = "create" },
            { key = "d",                            action = "remove" },
            { key = "D",                            action = "trash" },
            { key = "r",                            action = "rename" },
            { key = "<C-r>",                        action = "full_rename" },
            { key = "x",                            action = "cut" },
            { key = "c",                            action = "copy" },
            { key = "p",                            action = "paste" },
            { key = "y",                            action = "copy_name" },
            { key = "Y",                            action = "copy_path" },
            { key = "gy",                           action = "copy_absolute_path" },
            { key = "[c",                           action = "prev_git_item" },
            { key = "]c",                           action = "next_git_item" },
            { key = "-",                            action = "dir_up" },
            -- { key = "s",                            action = "system_open" },
            { key = "q",                            action = "close" },
            { key = "g?",                           action = "toggle_help" },
            { key = "W",                            action = "collapse_all" },
            { key = "<C-k>",                        action = "toggle_file_info" },
            },
        }
    },
})
vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
}
vim.g.nvim_tree_window_picker_chars ='asdfjkl'
vim.g.nvim_tree_indent_markers = 1
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})



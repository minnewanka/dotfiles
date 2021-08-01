local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        file_ignore_patterns = {"*.bundle.js"},
        prompt_prefix = ' > ',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-e>"] = require('telescope.actions').cycle_history_next,
                ["<C-f>"] = require('telescope.actions').cycle_history_prev,
                ["<C-q>"] = actions.smart_send_to_qflist,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<leader>q"] = actions.close,
            },
            n = {
                ["<C-q>"] = actions.smart_send_to_qflist,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<leader>q"] = actions.close,
            },
        }

    },
    pickers = {
        oldfiles = {
            theme = "dropdown",
            previewer = false,
        },
        find_files = {
            sort_mru = true,
            theme = "dropdown",
            previewer = false,
        },
        buffers = {
            sort_mru = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
                i = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                },
                n = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                }
            }
        },
    },
}



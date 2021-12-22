vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    space_char_blankline = " ",
     show_first_indent_level = true,
    show_current_context = true,
    buftype_exclude = {'terminal', 'nofile', 'NvimTree'},
    filetype_exclude = {'help', 'packer', 'startify', 'NvimTree', 'alpha', 'git',  "fugitive", "gitcommit",'TelescopePrompt'},
    context_patterns = {
        'class',
        'return',
        'function',
        'method',
        '^if',
        '^while',
        'jsx_element',
        '^for',
        '^object',
        '^table',
        'block',
        'arguments',
        'if_statement',
        'else_clause',
        'jsx_element',
        'jsx_self_closing_element',
        'try_statement',
        'catch_clause',
        'import_statement',
        'operation_type'
    },
}

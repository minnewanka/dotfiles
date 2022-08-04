vim.api.nvim_exec([[
function! MyHighlights() abort

highlight link LightspeedLabel Yellow
highlight LightspeedShortcut guibg=#e9b143 guifg=#000000
highlight LightspeedOneCharMatch guibg=#A89985 guifg=#000000
highlight link LightspeedMaskedChar Pink
highlight LightspeedCursor guibg=#e9b143 guifg=#000000
highlight link YankHighlight IncSearch

endfunction

augroup custom_highlight
  autocmd!
  au ColorScheme * call MyHighlights()
augroup END
    ]], false)

 vim.cmd 'colorscheme nordfox'

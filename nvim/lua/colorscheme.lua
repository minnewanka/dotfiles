vim.api.nvim_exec([[
function! MyHighlights() abort

highlight YankHighlight guibg=#e9b143 guifg=#282828
highlight NormalFloat guifg=#e2cca9 guibg=#282828
highlight link NormalFloat Normal 
highlight link TSProperty Green 
highlight link TSConstructor Yellow 
highlight! link NvimTreeFolderIcon Red
highlight link packerStatusSuccess Orange

endfunction

augroup custom_highlight
  autocmd!
  au ColorScheme * call MyHighlights()
augroup END
    ]], false)

vim.cmd 'colorscheme gruvbox-material'


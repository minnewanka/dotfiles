vim.api.nvim_exec([[
function! MyHighlights() abort
highlight link YankHighlight Visual
highlight link TelescopeSelection TSTextReference
highlight link TelescopeSelectionCaret TSTextReference
endfunction

augroup custom_highlight
  autocmd!
  au ColorScheme * call MyHighlights()
augroup END
    ]], false)

vim.g.SignatureMarkTextHL = "Constant"


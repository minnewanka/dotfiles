vim.api.nvim_exec([[

hi! link GitSignsCurrentLineBlame Comment

highlight link YankHighlight Visual
highlight Comment cterm=italic gui=italic

highlight link TelescopeSelection TSTextReference
highlight link TelescopeSelectionCaret TSTextReference

]], false)

vim.g.SignatureMarkTextHL = "Constant"

--[[ highlight! link LightspeedLabel Green
highlight! link LspDiagnosticsDefaultError Red
highlight! link LspDiagnosticsDefaultHint Blue
highlight! link LightspeedShortcut Search ]]

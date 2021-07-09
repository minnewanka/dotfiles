vim.api.nvim_exec([[

hi! link GitSignsCurrentLineBlame Comment

highlight link YankHighlight Visual
highlight Comment cterm=italic gui=italic

highlight link TelescopeSelection Blue
highlight link TelescopeSelectionCaret Red
highlight link TelescopeMatching Blue


highlight! link LspSagaDiagnosticBorder Fg
highlight! link LspSagaDiagnosticHeader Fg
highlight! link LspSagaDiagnosticTruncateLine Fg
highlight! link LspSagaHoverBorder Fg
highlight! link LspSagaSignatureHelpBorder Fg

highlight link NvimTreeFolderIcon Blue

]], false)

vim.g.SignatureMarkTextHL = "Constant"

--[[ highlight! link LightspeedLabel Green
highlight! link LspDiagnosticsDefaultError Red
highlight! link LspDiagnosticsDefaultHint Blue
highlight! link LightspeedShortcut Search ]]

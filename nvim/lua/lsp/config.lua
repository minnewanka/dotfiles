vim.fn.sign_define("LspDiagnosticsSignError", {  text = "", numhl = "LspDiagnosticsSignError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsSignWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", {  text = "", numhl = "LspDiagnosticsSignInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", {  text = "", numhl = "LspDiagnosticsSignHint" })

vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "single"
  }
)



vim.api.nvim_set_keymap('n', 'K',  [[<Cmd>lua vim.lsp.buf.hover()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gs',  [[<Cmd>lua vim.lsp.buf.signature_help()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ge',  [[<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "single" })<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ca',  [[<Cmd>lua vim.lsp.buf.code_action()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>rr',  [[<Cmd>lua vim.lsp.buf.rename()<CR>]], { noremap = true, silent = true })

--Saga
vim.api.nvim_set_keymap('n', '<Leader>rr',  [[<Cmd>lua require('lspsaga.rename').rename()<CR>]], { noremap = true, silent = true })


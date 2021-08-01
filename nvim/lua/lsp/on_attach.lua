local function buf_option(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

local function on_attach(client)
  buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

   --[[ require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "single"
      }
    }) ]]

   -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

return on_attach

local function on_attach(client, bufnr)
	-- buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	vim.keymap.set("n", "grd", vim.lsp.buf.definition, { noremap = true, silent = true })
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })

	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false,
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = "lsp_document_highlight",
		})
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

return on_attach

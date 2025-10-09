local function on_attach(client, bufnr)
	-- buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	vim.keymap.set("n", "grd", vim.lsp.buf.definition, { noremap = true, silent = true })
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({ border = "rounded" })
	end, { noremap = true, silent = true })

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

	-- ========== CodeLens ==========
	if client.server_capabilities.codeLensProvider then
		local codelens_group = vim.api.nvim_create_augroup("lsp_codelens_" .. bufnr, {
			clear = true,
		})

		vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
			group = codelens_group,
			buffer = bufnr,
			callback = function()
				vim.lsp.codelens.refresh({ bufnr = bufnr })
			end,
		})

		vim.keymap.set("n", "<leader>ll", vim.lsp.codelens.run, { buffer = bufnr, desc = "LSP: Run codelens" })

		vim.lsp.codelens.refresh({ bufnr = bufnr })
	end

	-- ========== Inlay Hints ==========
	if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
end

return on_attach

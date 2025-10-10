local function on_attach(client, bufnr)
	-- buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	vim.keymap.set("n", "grd", vim.lsp.buf.definition, { noremap = true, silent = true })
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({ border = "rounded" })
	end, { noremap = true, silent = true })

	vim.keymap.set("n", "gry", vim.lsp.buf.incoming_calls, opts)
	vim.keymap.set("n", "gro", vim.lsp.buf.outgoing_calls, opts)
	vim.keymap.set("n", "grh", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end)

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
		-- Peek in smaller horizontal split (my favorite)
		vim.keymap.set("n", "grp", function()
			vim.cmd("split")
			vim.cmd("resize 15") -- Small peek window
			vim.lsp.buf.definition()
		end, opts)
	end

	-- ========== Inlay Hints ==========
	if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
end

return on_attach

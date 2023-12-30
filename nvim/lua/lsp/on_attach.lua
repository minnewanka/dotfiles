local function on_attach(client, bufnr)
	-- buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
	vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })

	if client.server_capabilities.documentFormattingProvider then
		vim.keymap.set(
			"n",
			"<Leader><Leader>",
			[[<Cmd>lua vim.lsp.buf.format()<CR>]],
			{ noremap = true, silent = true }
		)
	end
	vim.keymap.set("n", "gi", [[<Cmd>lua vim.lsp.buf.implementation()<CR>]], { noremap = true, silent = true })

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

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint(bufnr, true)
	end

	--[[ vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.cmd("Lspsaga show_line_diagnostics")
		end,
	}) ]]
end

return on_attach

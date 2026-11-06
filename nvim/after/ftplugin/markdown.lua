-- Preview in Lettera. It reads the file from disk, so save first.
vim.keymap.set("n", "<leader>mp", function()
	vim.cmd("silent update")
	vim.system({ "open", "-a", "Lettera", vim.api.nvim_buf_get_name(0) })
end, { buffer = true, desc = "Markdown preview (Lettera)" })

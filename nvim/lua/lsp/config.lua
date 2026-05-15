vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = "󰋼 ",
			[vim.diagnostic.severity.HINT] = "󰋼 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
		},
	},
})


vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { noremap = true, silent = true })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { noremap = true, silent = true })

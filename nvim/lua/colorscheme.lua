vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "YankHighlight", { link = "Search" })
		vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#e2cca9", bg = "#282828" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#928374", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { link = "Red" })
		vim.api.nvim_set_hl(0, "TSProperty", { link = "Green" })
		vim.api.nvim_set_hl(0, "TSConstructor", { link = "Yellow" })
		vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#777777" })
		vim.api.nvim_set_hl(0, "CurrentWord", { bg = "#32302f", bold = true })
		vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "DiagnosticError", { link = "Red" })
		vim.api.nvim_set_hl(0, "DiagnosticHint", { link = "Green" })
		vim.api.nvim_set_hl(0, "DiagnosticWarn", { link = "Yellow" })
	end,
})

vim.cmd("colorscheme gruvbox-material")

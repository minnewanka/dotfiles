vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "YankHighlight", { link = "Search" })

		-- Extend Alabaster's LSP semantic-token theming for TS/JS/React.
		-- Alabaster's model: color definitions (blue) + named constants (purple), leave usages plain.
		local def_fg = "#71ade7" -- Alabaster's definition blue
		local const_fg = "#cc8bc9" -- Alabaster's constant purple
		-- Definitions -> blue
		vim.api.nvim_set_hl(0, "@lsp.typemod.interface.declaration", { fg = def_fg }) -- interface Foo (gap in Alabaster's set)
		-- Named constants -> purple
		vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = const_fg })
		vim.api.nvim_set_hl(0, "@lsp.typemod.enumMember.defaultLibrary", { fg = const_fg })
		-- vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#e2cca9", bg = "NONE" })
		-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#928374", bg = "NONE" })
		-- vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { link = "Red" })
		-- -- vim.api.nvim_set_hl(0, "TSProperty", { link = "Green" })
		-- vim.api.nvim_set_hl(0, "TSConstructor", { link = "Yellow" })
		-- vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#777777" })
		-- -- vim.api.nvim_set_hl(0, "CurrentWord", { bg = "#32302f", bold = true })
		-- vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = "NONE" })
		-- vim.api.nvim_set_hl(0, "DiagnosticError", { link = "Red" })
		-- vim.api.nvim_set_hl(0, "DiagnosticHint", { link = "Green" })
		-- vim.api.nvim_set_hl(0, "DiagnosticWarn", { link = "Yellow" })
		-- vim.api.nvim_set_hl(0, "WinBar", { link = "Yellow" })
		-- -- vim.api.nvim_set_hl(0, "FlashMatch", { link = "Comment" })
		-- -- vim.api.nvim_set_hl(0, "FlashCurrent", { link = "Red" })
		-- -- vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ccff88", bg = "NONE" })
		-- vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#2e3b3b" })
		-- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = "#2e3b3b" })
	end,
})

vim.o.background = "dark"
vim.cmd("colorscheme alabaster")

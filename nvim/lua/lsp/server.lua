local ts_inlay_hints = {
	parameterNames = { enabled = "none" },
	parameterTypes = { enabled = false },
	variableTypes = { enabled = false },
	propertyDeclarationTypes = { enabled = false },
	functionLikeReturnTypes = { enabled = false },
	enumMemberValues = { enabled = true },
}

vim.lsp.config("vtsls", {
	settings = {
		typescript = { inlayHints = ts_inlay_hints },
		javascript = { inlayHints = ts_inlay_hints },
	},
})
vim.lsp.enable("vtsls")

vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
})
vim.lsp.enable("basedpyright")

vim.lsp.enable("eslint")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("marksman")
vim.lsp.enable("zls")

vim.lsp.config("jsonls", {
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig.json", "tsconfig.*.json" },
					url = "http://json.schemastore.org/tsconfig",
				},
			},
		},
	},
})

-- jdtls is started per-project by nvim-jdtls in after/ftplugin/java.lua,
-- not via vim.lsp.enable (jdt:// decompiled-source navigation needs nvim-jdtls)
vim.lsp.enable("clangd")

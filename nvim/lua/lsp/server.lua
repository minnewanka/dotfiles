-- blink.cmp does not wire its capabilities into vim.lsp.config itself -- it only
-- exposes get_lsp_capabilities(). Without this every server below ran on Neovim's
-- stock capabilities: no snippetSupport, no resolveSupport (additionalTextEdits),
-- no labelDetailsSupport. Applied to "*" so each server inherits it; per-server
-- blocks below merge on top rather than replacing it.
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

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
vim.lsp.enable("jsonls")

-- jdtls is started by nvim-jdtls in after/ftplugin/java.lua, not via vim.lsp.enable:
-- jdt:// decompiled-source navigation, the debug/test bundles and the shared-workspace
-- root resolution all need nvim-jdtls.
vim.lsp.enable("clangd")

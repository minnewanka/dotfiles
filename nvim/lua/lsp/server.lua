local on_attach = require("lsp.on_attach")
local util = require("lspconfig/util")
local root_pattern = util.root_pattern
local capabilities = require("blink.cmp").get_lsp_capabilities()

require("typescript-tools").setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.config("eslint", {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.config("html", {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.config("cssls", {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.config("jsonls", {
	on_attach = on_attach,
	capabilities = capabilities,
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

vim.lsp.enable("marksman")

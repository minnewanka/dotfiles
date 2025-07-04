local on_attach = require("lsp.on_attach")
local util = require("lspconfig/util")
local root_pattern = util.root_pattern
local capabilities = require("blink.cmp").get_lsp_capabilities()

require("typescript-tools").setup({
	on_attach = on_attach,
})

require("lspconfig").eslint.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").basedpyright.setup({})


-- require("lspconfig").tailwindcss.setup({})

require("lspconfig").html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").jsonls.setup({
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

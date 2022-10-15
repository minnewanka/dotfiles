local on_attach = require("lsp.on_attach")
local util = require("lspconfig/util")
local root_pattern = util.root_pattern
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig").emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				["bem.enabled"] = true,
			},
		},
	},
})

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

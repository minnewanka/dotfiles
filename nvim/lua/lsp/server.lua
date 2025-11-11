local util = require("lspconfig/util")
local root_pattern = util.root_pattern

require("typescript-tools").setup({
	settings = {
		expose_as_code_action = "all", -- your settings here
		tsserver_plugins = {
			"@styled/typescript-styled-plugin",
		},
	},
})

vim.lsp.enable("eslint")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("marksman")

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

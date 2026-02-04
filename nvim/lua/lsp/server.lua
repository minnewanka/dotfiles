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

vim.lsp.config("jdtls", {
	root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" }),
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-1.8",
						path = "/Users/Pro/.sdkman/candidates/java/8.0.472-amzn",
					},
					{
						name = "JavaSE-11",
						path = "/Users/Pro/.sdkman/candidates/java/11.0.29-amzn",
					},
					{
						name = "JavaSE-17",
						path = "/Users/Pro/.sdkman/candidates/java/17.0.17-amzn",
						default = true,
					},
					{
						name = "JavaSE-21",
						path = "/Users/Pro/.sdkman/candidates/java/21.0.9-amzn",
					},
				},
			},
		},
	},
})
vim.lsp.enable("jdtls")

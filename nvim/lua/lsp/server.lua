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
vim.lsp.enable("clangd")

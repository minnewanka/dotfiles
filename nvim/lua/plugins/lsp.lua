return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp/config")
			require("lsp/server")
		end,
	},
	{ "onsails/lspkind-nvim", event = "VeryLazy" },
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {},
	},
	{ "mfussenegger/nvim-jdtls" },
}
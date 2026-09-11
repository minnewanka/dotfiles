return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp/config")
			require("lsp/server")
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {},
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		dependencies = { "mfussenegger/nvim-dap" },
	},
	{
		-- Only pulled in by nvim-jdtls, so these mappings appear once a java buffer
		-- opens. jdtls registers the launch configurations itself in after/ftplugin.
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			local dap = require("dap")
			local map = function(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
			end

			map("<leader>db", dap.toggle_breakpoint, "DAP: toggle breakpoint")
			map("<leader>dc", dap.continue, "DAP: continue / start")
			map("<leader>di", dap.step_into, "DAP: step into")
			map("<leader>do", dap.step_over, "DAP: step over")
			map("<leader>dO", dap.step_out, "DAP: step out")
			map("<leader>dr", dap.repl.toggle, "DAP: toggle REPL")
			map("<leader>dq", dap.terminate, "DAP: terminate")
		end,
	},
}

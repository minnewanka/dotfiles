return {
	{
		"github/copilot.vim",
		event = "VeryLazy",
		-- LuaSnip must set its <Tab> insert map before copilot.vim sources, so
		-- copilot#Accept() wraps the luasnip mapping as its fallback (accept a
		-- suggestion if present, otherwise luasnip expand/jump). Without this the
		-- alphabetical plugin-dir import loads copilot first and luasnip then
		-- overwrites <Tab>, breaking Tab-to-accept.
		dependencies = { "L3MON4D3/LuaSnip" },
		config = function()
			vim.api.nvim_set_keymap("i", "<C-c>", "copilot#Dismiss()", { silent = true, expr = true })
			vim.api.nvim_set_keymap("i", "<C-s>", "copilot#Suggest()", { silent = true, expr = true })
			vim.api.nvim_set_keymap("i", "<C-n>", "copilot#Next()", { silent = true, expr = true })
			vim.api.nvim_set_keymap("i", "<C-p>", "copilot#Previous()", { silent = true, expr = true })
			vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
				expr = true,
				replace_keycodes = false,
			})
		end,
	},
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		lazy = false,
		config = function()
			require("claudecode").setup({
				terminal = {
					split_width_percentage = 0.4,
				},
				diff_opts = {
					open_in_new_tab = true,
					hide_terminal_in_new_tab = true,
				},
			})
		end,
		keys = {
			{ "<leader>c", nil, desc = "AI/Claude Code" },
			{ "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>cb", "<cmd>lua require('claude_route').add_file()<cr>", desc = "Send buffer ref to project Claude" },
			{ "<leader>cs", "<Esc><cmd>lua require('claude_route').send_selection()<cr>", mode = "v", desc = "Send selection to project Claude" },
			{
				"<leader>cs",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
			},
			-- Diff management
			{ "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},
}
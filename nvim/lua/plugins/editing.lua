return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescriptreact = { "prettierd" },
					svelte = { "prettierd" },
					css = { "prettierd" },
					html = { "prettierd" },
					json = { "prettierd" },
					yaml = { "prettierd" },
					markdown = { "prettierd" },
					graphql = { "prettierd" },
					liquid = { "prettierd" },
					lua = { "stylua" },
					python = { "isort" },
				},
				format_on_save = {
					lsp_format = "fallback",
					async = false,
					timeout_ms = 1000,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader><leader>", function()
				conform.format({
					lsp_format = "fallback",
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mappings = {
					t = { j = { false } }, -- lazygit navigation fix
					v = { j = { false } }, -- lazygit navigation fix
				},
			})
		end,
	},
	{
		url = "https://codeberg.org/andyg/leap.nvim",
		config = function()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)", { desc = "Leap" })
			vim.keymap.set("n", "S", "<Plug>(leap-from-window)", { desc = "Leap from window" })
		end,
	},
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "tpope/vim-unimpaired", event = "VeryLazy" },
	{
		"kwkarlwang/bufjump.nvim",
		event = "VeryLazy",
		config = function()
			vim.keymap.set(
				"n",
				"<Left>",
				":lua require('bufjump').backward()<CR>",
				{ noremap = true, silent = true, desc = "Bufjump backward" }
			)
			vim.keymap.set(
				"n",
				"<Right>",
				":lua require('bufjump').forward()<CR>",
				{ noremap = true, silent = true, desc = "Bufjump forward" }
			)
			vim.keymap.set(
				"n",
				"<M-o>",
				":lua require('bufjump').backward_same_buf()<cr>",
				{ noremap = true, silent = true, desc = "Bufjump backward same buf" }
			)
			vim.keymap.set(
				"n",
				"<M-i>",
				":lua require('bufjump').forward_same_buf()<cr>",
				{ noremap = true, silent = true, desc = "Bufjump forward same buf" }
			)
		end,
	},
	{ "andymass/vim-matchup", event = "VeryLazy" },
	{
		"chrisgrieser/nvim-various-textobjs",
		config = function()
			require("various-textobjs").setup({ keymaps = {
				useDefaults = false,
			} })
			vim.keymap.set({ "o", "x" }, "ii", function()
				require("various-textobjs").indentation("inner", "inner")
			end, { desc = "Select inner indentation" })
			vim.keymap.set({ "o", "x" }, "ai", function()
				require("various-textobjs").indentation("outer", "inner")
			end, { desc = "Select outer indentation" })
			vim.keymap.set({ "o", "x" }, "as", function()
				require("various-textobjs").subword("outer")
			end, { desc = "Select outer subword" })
			vim.keymap.set({ "o", "x" }, "is", function()
				require("various-textobjs").subword("inner")
			end, { desc = "Select inner subword" })
			vim.keymap.set({ "o", "x" }, "n", function()
				require("various-textobjs").nearEoL()
			end, { desc = "Select near end of line" })
			vim.keymap.set({ "o", "x" }, "r", function()
				require("various-textobjs").restOfParagraph()
			end, { desc = "Select rest of paragraph" })
			vim.keymap.set(
				{ "o", "x" },
				"iv",
				"<cmd>lua require('various-textobjs').value('inner')<CR>",
				{ desc = "Select inner value" }
			)
			vim.keymap.set(
				{ "o", "x" },
				"av",
				"<cmd>lua require('various-textobjs').value('outer')<CR>",
				{ desc = "Select outer value" }
			)

			vim.keymap.set(
				{ "o", "x" },
				"ik",
				"<cmd>lua require('various-textobjs').key('inner')<CR>",
				{ desc = "Select inner key" }
			)
			vim.keymap.set(
				{ "o", "x" },
				"ak",
				"<cmd>lua require('various-textobjs').key('outer')<CR>",
				{ desc = "Select outer key" }
			)
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"carbon-steel/detour.nvim",
		config = function()
			vim.keymap.set("n", "<c-w><enter>", ":Detour<cr>", { desc = "Open Detour window" })
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		config = function()
			require("oil").setup({
				keymaps = {
					["<C-p>"] = false,
					["<C-l>"] = false,
					["<C-h>"] = false,
					gs = {
						callback = function()
							-- get the current directory
							local prefills = { paths = require("oil").get_current_dir() }

							local grug_far = require("grug-far")
							-- instance check
							if not grug_far.has_instance("explorer") then
								grug_far.open({
									instanceName = "explorer",
									prefills = prefills,
									staticTitle = "Find and Replace from Explorer",
								})
							else
								grug_far.open_instance("explorer")
								-- updating the prefills without clearing the search and other fields
								grug_far.update_instance_prefills("explorer", prefills, false)
							end
						end,
						desc = "oil: Search in directory",
					},
					yp = {
						desc = "Copy filepath to system clipboard",
						callback = function()
							require("oil.actions").copy_entry_path.callback()
							vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
						end,
					},
				},
			})
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>e",
				":Oil<CR>",
				{ noremap = true, silent = true, desc = "Open Oil file explorer" }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>n",
				":Oil<CR>",
				{ noremap = true, silent = true, desc = "Open Oil file explorer" }
			)
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		config = function()
			require("marks").setup({
				default_mappings = true,
				force_write_shada = true,
				signs = true,
				mappings = {},
				cycle = true,
			})
		end,
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			-- optional setup call to override plugin options
			-- alternatively you can set options with vim.g.grug_far = { ... }
			require("grug-far").setup({
				-- options, see Configuration section below
				-- there are no required options atm
				-- engine = 'ripgrep' is default, but 'astgrep' or 'astgrep-rules' can
				-- be specified
			})
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>s",
				[[<Cmd>lua require("grug-far").open()<CR>]],
				{ noremap = true, silent = true, desc = "Open Grug-Far search" }
			)
		end,
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = "<leader>u",
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>u",
				":UndotreeToggle<CR>",
				{ silent = true, noremap = true, desc = "Toggle Undotree" }
			)
			vim.g.undotree_WindowLayout = 2
			vim.g.undotree_SplitWidth = 50
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		keys = { "<leader>h", "<leader>a", "<leader>1", "<leader>2", "<leader>3", "<leader>4", "<leader>5" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup({
				settings = {
					save_on_toggle = true,
					sync_on_ui_close = true,
				},
			})

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Add file to Harpoon" })
			vim.keymap.set("n", "<leader>h", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Toggle Harpoon quick menu" })

			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end, { desc = "Go to Harpoon file 1" })
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end, { desc = "Go to Harpoon file 2" })
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end, { desc = "Go to Harpoon file 3" })
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end, { desc = "Go to Harpoon file 4" })
		end,
	},
	{ "romainl/vim-cool" },
	{ "nanotee/zoxide.vim" },
}
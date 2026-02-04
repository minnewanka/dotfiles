return {
	"nvim-tree/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	{
		"github/copilot.vim",
		event = "VeryLazy",
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
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader><leader>", function()
				conform.format({
					lsp_fallback = true,
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
		"natecraddock/workspaces.nvim",
		config = function()
			require("workspaces").setup({
				hooks = {
					open = {
						"lua require('telescope').extensions.smart_open.smart_open(require('telescope.themes').get_dropdown({ cwd_only = true, previewer = false, theme = 'ivy' }))",
					},
				},
			})
			vim.api.nvim_set_keymap(
				"n",
				"<leader>sp",
				[[<Cmd>Telescope workspaces theme=ivy<CR>]],
				{ noremap = true, silent = true, desc = "Open workspaces picker" }
			)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	{ "onsails/lspkind-nvim", event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "kwkarlwang/bufjump.nvim", event = "VeryLazy" },
	{ "andymass/vim-matchup", event = "VeryLazy" },
	{

		"pwntester/octo.nvim",
		cmd = { "Octo" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	},
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
		"nanozuki/tabby.nvim",
		event = "VeryLazy",
		config = function()
			local theme = {
				fill = "TabLineFill",
				-- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
				head = "TabLine",
				current_tab = "TabLineSel",
				tab = "TabLine",
				win = "TabLine",
				tail = "TabLine",
			}
			require("tabby").setup({
				line = function(line)
					return {
						{
							{ "  ", hl = theme.head },
							line.sep("", theme.head, theme.fill),
						},
						line.tabs().foreach(function(tab)
							local hl = tab.is_current() and theme.current_tab or theme.tab
							return {
								line.sep("", hl, theme.fill),
								tab.is_current() and "" or "󰆣",
								tab.number(),
								line.sep("", hl, theme.fill),
								hl = hl,
								margin = " ",
							}
						end),
						line.spacer(),
						line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
							return {
								line.sep("", theme.win, theme.fill),
								win.is_current() and "" or "",
								win.buf_name(),
								line.sep("", theme.win, theme.fill),
								hl = theme.win,
								margin = " ",
							}
						end),
						{
							line.sep("", theme.tail, theme.fill),
							{ "  ", hl = theme.tail },
						},
						hl = theme.fill,
					}
				end,
				-- option = {}, -- setup modules' option,
			})
			vim.o.showtabline = 1
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp/config")
			require("lsp/server")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "gruvbox-material",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {},
					always_divide_middle = true,
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "buffers" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				extensions = {},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

			parser_configs.norg = {
				install_info = {
					url = "https://github.com/vhyrro/tree-sitter-norg",
					files = { "src/parser.c" },
					branch = "main",
				},
			}

			require("nvim-treesitter.configs").setup({
				ensure_installed = { "tsx" },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							-- You can optionally set descriptions to the mappings (used in the desc parameter of
							-- nvim_buf_set_keymap) which plugins like which-key display
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							-- You can also use captures from other query groups like `locals.scm`
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
						-- You can choose the select mode (default is charwise 'v')
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * method: eg 'v' or 'o'
						-- and should return the mode ('v', 'V', or '<c-v>') or a table
						-- mapping query_strings to modes.
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						-- If you set this to `true` (default is `false`) then any textobject is
						-- extended to include preceding or succeeding whitespace. Succeeding
						-- whitespace has priority in order to act similarly to eg the built-in
						-- `ap`.
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * selection_mode: eg 'v'
						-- and should return true of false
						include_surrounding_whitespace = true,
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = { query = "@class.outer", desc = "Next class start" },
							--
							-- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
							["]o"] = "@loop.*",
							-- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
							--
							-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
							-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
							["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
							["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
						-- Below will go to either the start or the end, whichever is closer.
						-- Use if you want more granular movements
						-- Make it even more gradual by adding multiple queries and regex.
						goto_next = {
							["]d"] = "@conditional.outer",
						},
						goto_previous = {
							["[d"] = "@conditional.outer",
						},
					},
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<CR>",
						scope_incremental = "<CR>",
						node_incremental = "<TAB>",
						node_decremental = "<S-TAB>",
					},
				},
				matchup = {
					enable = true,
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{
		"nvim-treesitter/playground",
		cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
	},

	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Glog", "Gdiffsplit", "GBlame", "GBrowse" },
		dependencies = { "tpope/vim-rhubarb" },
		init = function()
			vim.api.nvim_create_user_command("ToggleGStatus", function()
				require("lazy").load({ plugins = { "vim-fugitive" } })
				vim.schedule(function()
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						if vim.bo[buf].filetype == "fugitive" then
							for _, win in ipairs(vim.api.nvim_list_wins()) do
								if vim.api.nvim_win_get_buf(win) == buf then
									vim.api.nvim_win_close(win, false)
									return
								end
							end
							return
						end
					end
					vim.cmd("Git")
				end)
			end, {})
		end,
	},
	{
		"tpope/vim-unimpaired",
		event = "VeryLazy",
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		branch = "main",
		config = function()
			require("gitsigns").setup({
				-- numhl = false,
				-- linehl = false,
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "gn", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, desc = "Next Hunk" })

					map("n", "gp", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true, desc = "Prev Hunk" })

					-- Actions
					map("n", "ghs", gs.stage_hunk, { desc = "Stage Hunk" })
					map("n", "ghr", gs.reset_hunk, { desc = "Reset Hunk" })
					map("v", "ghs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Stage Hunk" })
					map("v", "ghr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "Reset Hunk" })
					map("n", "ghS", gs.stage_buffer, { desc = "Stage Buffer" })
					map("n", "ghu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
					map("n", "ghR", gs.reset_buffer, { desc = "Reset Buffer" })
					map("n", "ghp", gs.preview_hunk, { desc = "Preview Hunk" })
					map("n", "ghb", function()
						gs.blame_line({ full = true })
					end, { desc = "Blame Line" })
					-- map("n", "gtb", gs.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
					map("n", "ghd", gs.diffthis, { desc = "Diff This" })
					map("n", "ghD", function()
						gs.diffthis("~")
					end, { desc = "Diff This ~" })
					-- map("n", "gtd", gs.toggle_deleted, { desc = "Toggle Deleted" })

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
				end,
				watch_gitdir = {
					interval = 1000,
				},
				current_line_blame = false,
				current_line_blame_opts = { delay = 2000 },
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-telescope/telescope-live-grep-args.nvim" },
		cmd = "Telescope",
		module = "telescope",
		config = function()
			local actions = require("telescope.actions")
			local lga_actions = require("telescope-live-grep-args.actions")

			require("telescope").setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					path_display = { "filename_first" },
					file_sorter = require("telescope.sorters").get_fzy_sorter,
					file_ignore_patterns = { "docs", "docs-dev", "node_modules" },
					prompt_prefix = " > ",
					color_devicons = true,

					mappings = {
						i = {
							["<C-e>"] = require("telescope.actions").cycle_history_next,
							["<C-f>"] = require("telescope.actions").cycle_history_prev,
							["<C-q>"] = actions.smart_send_to_qflist,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<esc>"] = actions.close,
							["<C-v>"] = require("telescope.actions").select_vertical,
							["<C-p>"] = require("telescope.actions.layout").toggle_preview,
						},
						n = {
							["<C-q>"] = actions.smart_send_to_qflist,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
				pickers = {
					current_buffer_fuzzy_find = {
						previewer = false,
					},
					live_grep = {
						sorting_strategy = "ascending",
						layout_config = {
							prompt_position = "top",
							width = 0.87,
							height = 0.80,
							preview_cutoff = 120,
							horizontal = { mirror = false },
							vertical = { mirror = false },
						},
					},
					oldfiles = {
						theme = "ivy",
					},
					find_files = {
						sort_mru = true,
						theme = "dropdown",
						previewer = false,
					},
					buffers = {
						sort_mru = true,
						ignore_current_buffer = true,
						theme = "dropdown",

						mappings = {
							i = {
								["<c-d>"] = require("telescope.actions").delete_buffer,
							},
							n = {
								["<c-d>"] = require("telescope.actions").delete_buffer,
							},
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<C-k>"] = lga_actions.quote_prompt(),
								["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							},
						},
						-- ... also accepts theme settings, for example:
						-- theme = "dropdown", -- use dropdown theme
						-- theme = { }, -- use own theme spec
						-- layout_config = { mirror=true }, -- mirror preview pane
					},
					frecency = {
						show_scores = false,
						show_unindexed = false,
						ignore_patterns = { "*.git/*", "node%_modules/.*" },
					},
				},
			})
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("live_grep_args")
			require("telescope").load_extension("workspaces")
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
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		keys = {
			{ "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
		},
	},

	{
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("colorizer").setup({ "*" }, {
				RGB = true, -- #RGB hex codes --blue
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		event = "VeryLazy",
	},

	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup({
				auto_save = "current",
				disable_on_zoom = true,
			})
			local map = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			map("n", "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
			map("n", "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
			map("n", "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
			map("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)

			map("t", "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
			map("t", "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
			map("t", "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
			map("t", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
		end,
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
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = function()
			require("hlslens").setup({ calm_down = true })
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		event = "VeryLazy",
		config = function()
			require("luasnip").setup({
				region_check_events = "CursorHold,InsertLeave",
				delete_check_events = "TextChanged,InsertEnter",
			})

			-- Load friendly-snippets first
			require("luasnip/loaders/from_vscode").load()
			-- Then load custom snippets (will override duplicates)
			require("luasnip/loaders/from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
			require("luasnip").filetype_extend("typescript", { "javascript" })
			require("luasnip").filetype_extend("typescriptreact", { "javascript" })
		end,
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source

		-- use a release tag to download pre-built binaries
		version = "*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-e: Hide menu
			-- C-k: Toggle signature help
			--
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = { preset = "enter", ["<C-D>"] = { "show", "show_documentation", "hide_documentation" } },
			cmdline = {
				keymap = {
					preset = "cmdline",
					["<Up>"] = { "select_prev", "fallback" },
					["<Down>"] = { "select_next", "fallback" },
					["<C-k>"] = { "select_prev", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
				},
			},

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			snippets = {
				preset = "luasnip",
			},

			completion = {
				menu = { border = "single" },
				documentation = { window = { border = "single" } },
			},
			signature = { enabled = true, window = { border = "single", show_documentation = true } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},

	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = function()
			require("fidget").setup()
		end,
	},
	-- {
	-- 	"MunifTanjim/prettier.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("prettier").setup({
	-- 			bin = "prettierd",
	-- 		})
	-- 	end,
	-- },
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
	},
	{
		"sainnhe/gruvbox-material",
	},
	{
		"danielfalk/smart-open.nvim",
		config = function()
			require("telescope").load_extension("smart_open")
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			-- Only required if using match_algorithm fzf
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			-- Optional.  If installed, native fzy will be used when match_algorithm is fzy
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			zen = {
				enabled = true,
				toggles = {
					dim = false,
					git_signs = true,
				},
				win = {
					backdrop = { transparent = false, blend = 80 },
				},
			},
			lazygit = { enabled = true },
			notifier = { enabled = true },
			picker = { enabled = true },
		},
		keys = {
			{
				"gz",
				function()
					Snacks.zen()
				end,
			},
			{
				"<leader>gl",
				function()
					Snacks.lazygit.open()
				end,
			},
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- Create some toggle mappings
					Snacks.toggle.line_number():map("<leader>ul")
					Snacks.toggle.inlay_hints():map("<leader>uh")
					Snacks.toggle.diagnostics():map("<leader>ud")
				end,
			})
		end,
	},
	{ "mfussenegger/nvim-jdtls" },
	-- {
	-- 	"olimorris/codecompanion.nvim",
	-- 	opts = {},
	-- 	init = function()
	-- 		require("code-companion-fidget"):init()
	-- 	end,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		{
	-- 			-- Make sure to set this up properly if you have lazy=true
	-- 			"MeanderingProgrammer/render-markdown.nvim",
	-- 			opts = {
	-- 				file_types = { "markdown", "Avante" },
	-- 			},
	-- 			ft = { "markdown", "Avante" },
	-- 		},
	-- 	},
	-- },
	{ "romainl/vim-cool" },
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
			{ "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
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
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		opts = {},
		config = function(_, opts)
			require("refactoring").setup(opts)
		end,
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		config = function()
			require("ts-error-translator").setup({})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"obsidian-nvim/obsidian.nvim",
		---@module 'obsidian'
		---@type obsidian.config
		keys = {
			{
				"<leader>o",
				"<cmd>Obsidian<cr>",
				desc = "Obsidian",
			},
			{
				"<leader>ot",
				"<cmd>Obsidian today<cr>",
				desc = "obsidian today",
			},
			{
				"<leader>on",
				"<cmd>Obsidian new<cr>",
				desc = "obsidian new",
			},
		},
		opts = {
			note_id_func = function(title)
				return title:gsub(" ", "-"):gsub("\\[\\^A-Za-z0-9-\\]", ""):lower()
			end,
			legacy_commands = false, -- this will be removed in the next major release
			workspaces = {
				{
					name = "work",
					path = "~/vaults/work",
				},
			},
		},
	},
}

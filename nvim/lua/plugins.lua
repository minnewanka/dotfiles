vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

return {
	"kyazdani42/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	{ "github/copilot.vim", event = "VeryLazy" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	"hrsh7th/cmp-nvim-lsp",
	{ "jose-elias-alvarez/typescript.nvim", event = "VeryLazy" },
	{ "onsails/lspkind-nvim", event = "VeryLazy" },
	{ "rafamadriz/friendly-snippets", event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "kwkarlwang/bufjump.nvim", event = "VeryLazy" },
	{ "andymass/vim-matchup", event = "VeryLazy" },
	{
		"chrisgrieser/nvim-various-textobjs",
		config = function()
			require("various-textobjs").setup({ useDefaultKeymaps = true })
		end,
	},

	{
		"nanozuki/tabby.nvim",
		event = "VeryLazy",
		config = function()
			local filename = require("tabby.filename")
			local util = require("tabby.util")

			local hl_tabline = util.extract_nvim_hl("TabLine")
			local hl_tabline_sel = util.extract_nvim_hl("TabLineSel")

			---@type TabbyTablineOpt
			local tabline = {
				hl = "TabLineFill",
				layout = "active_wins_at_tail",
				active_tab = {
					label = function(tabid)
						return {
							"  " .. vim.api.nvim_tabpage_get_number(tabid) .. "  ",
							hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = "bold" },
						}
					end,
					right_sep = { " ", hl = "TabLineFill" },
				},
				inactive_tab = {
					label = function(tabid)
						return {
							"  " .. vim.api.nvim_tabpage_get_number(tabid) .. "  ",
							hl = { fg = hl_tabline.fg, bg = hl_tabline.bg, style = "bold" },
						}
					end,
					right_sep = { " ", hl = "TabLineFill" },
				},
				top_win = {
					label = function(winid)
						return {
							" > " .. filename.unique(winid) .. " ",
							hl = "TabLine",
						}
					end,
					left_sep = { " ", hl = "TabLineFill" },
				},
				win = {
					label = function(winid)
						return {
							" - " .. filename.unique(winid) .. " ",
							hl = "TabLine",
						}
					end,
					left_sep = { " ", hl = "TabLineFill" },
				},
			}

			require("tabby").setup({
				tabline = tabline,
				opt = {
					show_at_least = 2,
				},
			})
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
		dependencies = { "kyazdani42/nvim-web-devicons" },
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
					lualine_c = {},
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
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},
				autotag = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					--[[ keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
    }, ]]
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
		"nvim-treesitter/playground",
		cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
	},

	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Glog", "Gdiffsplit", "GBlame" },
		dependencies = { "tpope/vim-rhubarb" },
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
				signs = {
					add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
					change = {
						hl = "GitSignsChange",
						text = "│",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "_",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "‾",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "~",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
				numhl = false,
				linehl = false,
				keymaps = {
					-- Default keymap options
					noremap = true,
					buffer = true,

					["n gn"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
					["n gp"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

					["n ghs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
					["n ghu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
					["n ghr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
					["n ghR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
					["n ghp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
					["n ghb"] = '<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>',
					-- Text objects
					["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
					["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
				},
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
		"b3nj5m1n/kommentary",
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = "telescope",
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					path_display = { "truncate" },
					file_sorter = require("telescope.sorters").get_fzy_sorter,
					file_ignore_patterns = { "docs", "docs-dev" },
					prompt_prefix = " > ",
					color_devicons = true,

					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

					mappings = {
						i = {
							["<C-e>"] = require("telescope.actions").cycle_history_next,
							["<C-f>"] = require("telescope.actions").cycle_history_prev,
							["<C-q>"] = actions.smart_send_to_qflist,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<leader>q"] = actions.close,
						},
						n = {
							["<C-q>"] = actions.smart_send_to_qflist,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<leader>q"] = actions.close,
						},
					},
				},
				pickers = {
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
						theme = "ivy",
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
			})
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
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		keys = { "<leader>e", "<leader>n" },
		config = function()
			local tree_cb = require("nvim-tree.config").nvim_tree_callback
			require("nvim-tree").setup({
				update_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					update_cwd = true,
				},
				filters = {
					dotfiles = false,
					custom = {},
				},
				git = {
					ignore = false,
				},
				view = {
					width = 55,
					mappings = {
						custom_only = true,
						list = {
							{ key = "<C-g>", cb = tree_cb("cd") },
							{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
							{ key = "<C-e>", action = "edit_in_place" },
							{ key = { "O" }, action = "edit_no_picker" },
							{ key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
							{ key = "<C-v>", action = "vsplit" },
							{ key = "<C-x>", action = "split" },
							{ key = "<C-t>", action = "tabnew" },
							{ key = "<", action = "prev_sibling" },
							{ key = ">", action = "next_sibling" },
							{ key = "P", action = "parent_node" },
							{ key = "<BS>", action = "close_node" },
							{ key = "<Tab>", action = "preview" },
							{ key = "K", action = "first_sibling" },
							{ key = "J", action = "last_sibling" },
							{ key = "I", action = "toggle_ignored" },
							{ key = "H", action = "toggle_dotfiles" },
							{ key = "R", action = "refresh" },
							{ key = "a", action = "create" },
							{ key = "d", action = "remove" },
							{ key = "D", action = "trash" },
							{ key = "r", action = "rename" },
							{ key = "<C-r>", action = "full_rename" },
							{ key = "x", action = "cut" },
							{ key = "c", action = "copy" },
							{ key = "p", action = "paste" },
							{ key = "y", action = "copy_name" },
							{ key = "Y", action = "copy_path" },
							{ key = "gy", action = "copy_absolute_path" },
							{ key = "[c", action = "prev_git_item" },
							{ key = "]c", action = "next_git_item" },
							{ key = "-", action = "dir_up" },
							-- { key = "s",                            action = "system_open" },
							{ key = "q", action = "close" },
							{ key = "g?", action = "toggle_help" },
							{ key = "W", action = "collapse_all" },
							{ key = "<C-k>", action = "toggle_file_info" },
						},
					},
				},
			})
			vim.g.nvim_tree_git_hl = 0
			vim.g.nvim_tree_show_icons = {
				git = 0,
				folders = 1,
				files = 1,
			}
			vim.g.nvim_tree_window_picker_chars = "asdfjkl"
			vim.g.nvim_tree_indent_markers = 1
			vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<Leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

			vim.api.nvim_exec(
				[[
highlight! link NvimTreeFolderIcon Red
]],
				false
			)
		end,
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
		"windwp/nvim-spectre",
		keys = "<leader>s",
		config = function()
			require("spectre").setup({
				mapping = {
					["send_to_qf"] = {
						map = "<C-q>",
						cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
						desc = "send all item to quickfix",
					},
				},
			})
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>s",
				[[<Cmd>lua require('spectre').open()<CR>]],
				{ noremap = true, silent = true }
			)
		end,
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = "<leader>u",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<CR>", { silent = true, noremap = true })
			vim.g.undotree_WindowLayout = 2
			vim.g.undotree_SplitWidth = 50
		end,
	},
	{
		"ThePrimeagen/harpoon",
		keys = { "<leader>h", "<leader>a", "<leader>1", "<leader>2", "<leader>3", "<leader>4", "<leader>5" },
		config = function()
			require("harpoon").setup({
				menu = {
					width = 100,
					height = 12,
				},
			})
			vim.api.nvim_set_keymap(
				"n",
				"<leader>h",
				[[<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>a",
				[[<Cmd>lua require("harpoon.mark").add_file()<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>1",
				[[<Cmd>lua require("harpoon.ui").nav_file(1)<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>2",
				[[<Cmd>lua require("harpoon.ui").nav_file(2)<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>3",
				[[<Cmd>lua require("harpoon.ui").nav_file(3)<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>4",
				[[<Cmd>lua require("harpoon.ui").nav_file(4)<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>5",
				[[<Cmd>lua require("harpoon.ui").nav_file(4)<CR>]],
				{ noremap = true, silent = true }
			)
		end,
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = function()
			require("hlslens").setup({})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		config = function()
			require("luasnip").setup({
				region_check_events = "CursorHold,InsertLeave",
				delete_check_events = "TextChanged,InsertEnter",
			})

			require("luasnip/loaders/from_vscode").load()
			require("luasnip").filetype_extend("typescript", { "javascript" })
			require("luasnip").filetype_extend("typescriptreact", { "javascript" })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local lspkind = require("lspkind")
			local cmp = require("cmp")
			local check_back_space = function()
				local col = vim.fn.col(".") - 1
				return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
			end

			local t = function(str)
				return vim.api.nvim_replace_termcodes(str, true, true, true)
			end
			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				formatting = {
					format = function(entry, vim_item)
						-- fancy icons and a name of kind
						vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

						-- set a name for each source
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[Latex]",
						})[entry.source.name]
						return vim_item
					end,
				},

				snippet = {
					expand = function(args)
						local luasnip = require("luasnip")
						if not luasnip then
							return
						end
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-j>"] = cmp.mapping({
						c = function()
							if cmp.visible() then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
							else
								vim.api.nvim_feedkeys(t("<Down>"), "n", true)
							end
						end,
						i = function(fallback)
							if cmp.visible() then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
							else
								fallback()
							end
						end,
					}),
					["<C-k>"] = cmp.mapping({
						c = function()
							if cmp.visible() then
								cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
							else
								vim.api.nvim_feedkeys(t("<Up>"), "n", true)
							end
						end,
						i = function(fallback)
							if cmp.visible() then
								cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
							else
								fallback()
							end
						end,
					}),
				}),
				sources = {
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "nvim_lsp" },
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		"glepnir/lspsaga.nvim",
		event = "VeryLazy",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		branch = "main",
		config = function()
			local saga = require("lspsaga")

			saga.init_lsp_saga({
				move_in_saga = { prev = "k", next = "j" },
				code_action_lightbulb = {
					enable = false,
					sign = false,
					sign_priority = 20,
					virtual_text = true,
				},
				finder_action_keys = {
					open = "<CR>",
					vsplit = "v",
					split = "s",
					tabe = "t",
					quit = "q",
					scroll_down = "<C-f>",
					scroll_up = "<C-b>", -- quit can be a table
				},
				symbol_in_winbar = {
					in_custom = false,
					enable = false,
					separator = "  ",
					show_file = false,
					click_support = false,
				},
			})

			vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true, noremap = true })
			vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
			vim.keymap.set(
				"v",
				"<leader>ca",
				"<cmd><C-U>Lspsaga range_code_action<CR>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_set_keymap("n", "<leader>r", [[<Cmd>Lspsaga rename<CR>]], { noremap = true, silent = true })
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
			vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true, noremap = true })
			vim.keymap.set("n", "gD", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
			vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap = true })
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		config = function()
			require("lsp/null-ls")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")

			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_first_indent_level = true,
				show_current_context = true,
				buftype_exclude = { "terminal", "nofile", "NvimTree", "alpha" },
				filetype_exclude = {
					"help",
					"packer",
					"startify",
					"NvimTree",
					"alpha",
					"git",
					"fugitive",
					"gitcommit",
					"TelescopePrompt",
				},
				context_patterns = {
					"class",
					"return",
					"function",
					"method",
					"^if",
					"^while",
					"jsx_element",
					"^for",
					"^object",
					"^table",
					"block",
					"arguments",
					"if_statement",
					"else_clause",
					"jsx_element",
					"jsx_self_closing_element",
					"try_statement",
					"catch_clause",
					"import_statement",
					"operation_type",
				},
			})
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
	},

	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			require("leap").setup({})
			require("leap").set_default_keymaps()
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = function()
			require("fidget").setup({
				sources = {
					["null-ls"] = {
						ignore = true,
					},
				},
			})
		end,
	},

	{
		"MunifTanjim/prettier.nvim",
		event = "VeryLazy",
		config = function()
			require("prettier").setup({
				bin = "prettierd",
			})
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
	},
	{
		"sainnhe/gruvbox-material",
	},

	{
		"ggandor/flit.nvim",
		event = "VeryLazy",
		config = function()
			require("flit").setup({
				multiline = false,
			})
		end,
	},
	{
		"folke/zen-mode.nvim",
		keys = { ";z" },
		config = function()
			require("zen-mode").setup({
				window = {
					height = 0.9,
				},
			})
			vim.api.nvim_set_keymap("n", ";z", ":ZenMode<CR>", { noremap = true, silent = true })
		end,
	},
}

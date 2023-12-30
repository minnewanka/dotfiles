vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

return {
	"nvim-tree/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	{
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
				dim = true,
			})
		end,
	},
	{ "github/copilot.vim", event = "VeryLazy" },
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern" },
			})
			vim.api.nvim_set_keymap(
				"n",
				"<leader>sp",
				[[<Cmd>Telescope projects<CR>]],
				{ noremap = true, silent = true }
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
			require("various-textobjs").setup({ useDefaultKeymaps = false })
			vim.keymap.set({ "o", "x" }, "ii", function()
				require("various-textobjs").indentation(true, true)
			end)
			vim.keymap.set({ "o", "x" }, "ai", function()
				require("various-textobjs").indentation(false, true)
			end)
			vim.keymap.set({ "o", "x" }, "as", function()
				require("various-textobjs").subword(false)
			end)
			vim.keymap.set({ "o", "x" }, "is", function()
				require("various-textobjs").subword(true)
			end)
			vim.keymap.set({ "o", "x" }, "n", function()
				require("various-textobjs").nearEoL()
			end)
			vim.keymap.set({ "o", "x" }, "r", function()
				require("various-textobjs").restOfParagraph()
			end)
			vim.keymap.set({ "o", "x" }, "iv", "<cmd>lua require('various-textobjs').value(true)<CR>")
			vim.keymap.set({ "o", "x" }, "av", "<cmd>lua require('various-textobjs').value(false)<CR>")

			vim.keymap.set({ "o", "x" }, "ik", "<cmd>lua require('various-textobjs').key(true)<CR>")
			vim.keymap.set({ "o", "x" }, "ak", "<cmd>lua require('various-textobjs').key(false)<CR>")
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
				ensure_installed = { "tsx" },
				autotag = {
					enable = true,
				},
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
	},
	{
		"nvim-treesitter/playground",
		cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
	},

	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Glog", "Gdiffsplit", "GBlame", "GBrowse" },
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
					end, { expr = true })

					map("n", "gp", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					-- Actions
					map("n", "ghs", gs.stage_hunk)
					map("n", "ghr", gs.reset_hunk)
					map("v", "ghs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					map("v", "ghr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					map("n", "ghS", gs.stage_buffer)
					map("n", "ghu", gs.undo_stage_hunk)
					map("n", "ghR", gs.reset_buffer)
					map("n", "ghp", gs.preview_hunk)
					map("n", "ghb", function()
						gs.blame_line({ full = true })
					end)
					map("n", "gtb", gs.toggle_current_line_blame)
					map("n", "ghd", gs.diffthis)
					map("n", "ghD", function()
						gs.diffthis("~")
					end)
					map("n", "gtd", gs.toggle_deleted)

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
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
					path_display = { "truncate" },
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
						theme = "dropdown",
						previewer = false,

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
			require("telescope").load_extension("projects")
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
			vim.keymap.set("n", "<c-w><enter>", ":Detour<cr>")
		end,
	},
	-- {
	-- 	"stevearc/oil.nvim",
	-- 	opts = {},
	-- 	-- Optional dependencies
	-- 	config = function()
	-- 		require("oil").setup()
	-- 		vim.api.nvim_set_keymap("n", "<Leader>e", ":Oil<CR>", { noremap = true, silent = true })
	-- 		vim.api.nvim_set_keymap("n", "<Leader>n", ":Oil<CR>", { noremap = true, silent = true })
	-- 	end,
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- },
	{
		"nvim-tree/nvim-tree.lua",
		keys = { "<leader>e", "<leader>n" },
		config = function()
			local function on_attach(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- BEGIN_DEFAULT_ON_ATTACH
				vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
				vim.keymap.set("n", "b", api.tree.change_root_to_node, opts("CD"))
				vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
				vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
				vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
				vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
				vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
				vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
				vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
				vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
				vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
				vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
				vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
				vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
				vim.keymap.set("n", "a", api.fs.create, opts("Create"))
				vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
				vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
				vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
				vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
				vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
				vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
				vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
				vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
				vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
				vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
				vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
				vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
				vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
				vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
				vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
				vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
				vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
				vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
				vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
				vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
				vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
				vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
				vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
				vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
				vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
				vim.keymap.set("n", "q", api.tree.close, opts("Close"))
				vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
				vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
				-- vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
				vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
				vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
				vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
				vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
				vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
				vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
				vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
				vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
				-- END_DEFAULT_ON_ATTACH
			end
			require("nvim-tree").setup({
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				on_attach = on_attach,
				renderer = {
					root_folder_label = ":t",
				},
				live_filter = {
					prefix = "> ",
					always_show_folders = false,
				},
				actions = {
					change_dir = {
						global = true,
					},
				},
				filters = {
					dotfiles = false,
					custom = {},
				},
				git = {
					ignore = true,
				},
				view = {
					width = 55,
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
			vim.api.nvim_set_keymap(
				"n",
				"[h",
				[[<Cmd>lua require("harpoon.ui").nav_prev()<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"]h",
				[[<Cmd>lua require("harpoon.ui").nav_next()<CR>]],
				{ noremap = true, silent = true }
			)
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

			require("luasnip/loaders/from_vscode").load()
			require("luasnip").filetype_extend("typescript", { "javascript" })
			require("luasnip").filetype_extend("typescriptreact", { "javascript" })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
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
		dependencies = { "nvim-tree/nvim-web-devicons" },
		branch = "main",
		config = function()
			local saga = require("lspsaga")

			saga.setup({
				callhierarchy = {
					show_detail = false,
					keys = {
						edit = "<CR>",
						vsplit = "s",
						split = "i",
						tabe = "t",
						jump = "o",
						quit = "q",
						expand_collapse = "u",
					},
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
			vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
			vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
			vim.keymap.set("n", "<Leader>tt", "<cmd>Lspsaga term_toggle<CR>")
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		config = function()
			require("lsp/null-ls")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("ibl").setup({ indent = { char = "▏" } })
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
	-- {
	-- 	"folke/flash.nvim",
	-- 	event = "VeryLazy",
	-- 	---@type Flash.Config
	-- 	opts = {
	-- 		modes = {
	-- 			char = {
	-- 				enabled = false,
	-- 			},
	-- 		},
	-- 	},
	-- 	keys = {
	-- 		{
	-- 			"s",
	-- 			mode = { "n", "x", "o" },
	-- 			function()
	-- 				-- default options: exact mode, multi window, all directions, with a backdrop
	-- 				require("flash").jump()
	-- 			end,
	-- 			desc = "Flash",
	-- 		},
	-- 		{
	-- 			"S",
	-- 			mode = { "n", "o", "x" },
	-- 			function()
	-- 				require("flash").treesitter()
	-- 			end,
	-- 			desc = "Flash Treesitter",
	-- 		},
	-- 		{
	-- 			"r",
	-- 			mode = "o",
	-- 			function()
	-- 				require("flash").remote()
	-- 			end,
	-- 			desc = "Remote Flash",
	-- 		},
	-- 	},
	-- },
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
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
		"folke/zen-mode.nvim",
		keys = { "go" },
		config = function()
			require("zen-mode").setup({
				window = {
					height = 0.9,
				},
			})
			vim.api.nvim_set_keymap("n", "go", ":ZenMode<CR>", { noremap = true, silent = true })
		end,
	},
}

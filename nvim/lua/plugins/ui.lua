return {
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
							{ "  ", hl = theme.head },
							line.sep("", theme.head, theme.fill),
						},
						line.tabs().foreach(function(tab)
							local hl = tab.is_current() and theme.current_tab or theme.tab
							return {
								line.sep("", hl, theme.fill),
								tab.is_current() and "" or "󰆣",
								tab.number(),
								line.sep("", hl, theme.fill),
								hl = hl,
								margin = " ",
							}
						end),
						line.spacer(),
						line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
							return {
								line.sep("", theme.win, theme.fill),
								win.is_current() and "" or "",
								win.buf_name(),
								line.sep("", theme.win, theme.fill),
								hl = theme.win,
								margin = " ",
							}
						end),
						{
							line.sep("", theme.tail, theme.fill),
							{ "  ", hl = theme.tail },
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
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "gruvbox-material",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {},
					always_divide_middle = true,
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "buffers" },
					lualine_x = {
						{
							function()
								return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
							end,
							color = { fg = "#a89984" },
						},
						"encoding",
						"fileformat",
						"filetype",
					},
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
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				RRGGBBAA = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
			},
		},
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
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = function()
			require("hlslens").setup({ calm_down = true })

			local map = vim.api.nvim_set_keymap
			map(
				"n",
				"n",
				"<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
				{ noremap = true, silent = true, desc = "Hlslens next" }
			)
			map(
				"n",
				"N",
				"<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
				{ noremap = true, silent = true, desc = "Hlslens prev" }
			)
			map("n", "*", "*<Cmd>lua require('hlslens').start()<CR>", { noremap = true, desc = "Hlslens next" })
			map("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", { noremap = true, desc = "Hlslens prev" })
			map("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>", { noremap = true, desc = "Hlslens next" })
			map("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>", { noremap = true, desc = "Hlslens prev" })
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = false },
			explorer = { enabled = true },
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
			picker = {
				enabled = true,
				filter = { cwd = true },
				formatters = {
					file = {
						filename_first = true,
					},
				},
				sources = {
					buffers = {
						current = false,
						win = {
							input = {
								keys = {
									["<c-d>"] = { "bufdelete", mode = { "n", "i" } },
								},
							},
							list = { keys = { ["dd"] = "bufdelete" } },
						},
					},
					smart = {
						multi = { "buffers", "recent", "files" },
						sort = { fields = { "source_id" } },
					},
				},
				win = {
					input = {
						keys = {
							["<Esc>"] = { "close", mode = { "n", "i" } },
							-- history nav on <c-k>/<c-j> (overrides default list_up/list_down);
							-- leaves the default preview scroll on <c-b>/<c-f> intact.
							["<c-k>"] = { "history_back", mode = { "i", "n" } },
							["<c-j>"] = { "history_forward", mode = { "i", "n" } },
							["<c-p>"] = { "toggle_preview", mode = { "i", "n" } },
							-- <c-h>/<c-l> move focus between windows. These shadow the global
							-- Navigator <C-h/l> maps so focus stays inside the picker instead
							-- of jumping to a neighbouring window (which auto-closes it).
							["<c-l>"] = { "focus_preview", mode = { "i", "n" } },
							["<c-h>"] = { "focus_list", mode = { "i", "n" } },
						},
					},
					-- Shadow the global Navigator <C-h/j/k/l> maps inside the list and
					-- preview windows too, otherwise focusing them and pressing a nav key
					-- jumps out of the picker and auto-closes it.
					list = {
						keys = {
							["<c-h>"] = "focus_input",
							["<c-l>"] = "focus_preview",
						},
					},
					preview = {
						keys = {
							["<c-h>"] = "focus_list",
							["<c-l>"] = "focus_input",
						},
					},
				},
			},
		},
		keys = {
			{
				"<C-p>",
				function()
					Snacks.picker.smart({ layout = "dropdown" })
				end,
				desc = "Smart Find Files",
			},
			{
				"<C-z>",
				function()
					Snacks.picker.zoxide({ layout = "dropdown" })
				end,
				desc = "Zoxide",
			},
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
			{
				"<leader>nt",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
			{
				"<leader>sp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Open project",
			},
			{
				"<leader>M",
				function()
					Snacks.picker.marks()
				end,
				desc = "Snacks marks",
			},
			{
				"<Leader>b",
				function()
					Snacks.picker.buffers({ current = true })
				end,
				desc = "Snacks buffers",
			},
			{
				"<Leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Snacks live grep",
			},
			{
				"<Leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Snacks find files",
			},
			{
				"<Leader>fs",
				function()
					Snacks.picker.grep_word()
				end,
				mode = { "n", "v" },
				desc = "Snacks grep word under cursor",
			},
			{
				"<Leader>fo",
				function()
					Snacks.picker.recent()
				end,
				desc = "Snacks recent files",
			},
			{
				"<Leader>fh",
				function()
					Snacks.picker.search_history()
				end,
				desc = "Snacks search history",
			},
			{
				"<Leader>/",
				function()
					Snacks.picker.lines()
				end,
				desc = "Snacks buffer lines",
			},
			{
				"<Leader>fb",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Snacks grep open buffers",
			},
			{
				"<Leader>fS",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "Snacks document symbols",
			},
			{
				"<Leader>fw",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "Snacks workspace symbols",
			},
			{
				"<Leader>fd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Snacks diagnostics",
			},
			{
				"<leader>sd",
				function()
					Snacks.picker.grep()
				end,
				desc = "Snacks live grep (glob)",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.resume()
				end,
				desc = "Snacks resume",
			},
			{
				"<leader>cs",
				function()
					local word = vim.fn.expand("<cword>")
					local ft = vim.bo.filetype
					local lines = vim.fn.systemlist("curl -s cheat.sh/" .. ft .. "/" .. word .. "?T")
					Snacks.win({
						text = lines,
						ft = ft,
						title = " cheat.sh/" .. ft .. "/" .. word .. " ",
						width = 0.7,
						height = 0.7,
					})
				end,
				desc = "Cheat.sh lookup",
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
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			delay = 300,
			preset = "helix",
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
}
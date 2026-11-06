return {
	{
		"pwntester/octo.nvim",
		cmd = { "Octo" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/snacks.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup({ picker = "snacks" })
		end,
	},
	{
		"emrearmagan/atlas.nvim",
		cmd = { "Atlas" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"dlyongemallo/diffview.nvim",
		},
		keys = {
			{ "<leader>Ap", "<cmd>Atlas pulls github<CR>", desc = "Atlas: GitHub PRs" },
			{ "<leader>Ai", "<cmd>Atlas issues github<CR>", desc = "Atlas: GitHub issues" },
			{ "<leader>Ar", "<cmd>Atlas review<CR>", desc = "Atlas: review PR" },
			{ "<leader>As", "<cmd>Atlas search<CR>", desc = "Atlas: search" },
		},
		---@type AtlasConfig
		opts = {
			ui = { picker = "snacks" },
			providers = {
				github = {}, -- uses `gh` auth
			},
			pulls = {
				github = {
					views = {
						{
							name = "Review requested",
							key = "1",
							layout = "compact",
							search = "is:open review-requested:@me sort:updated-desc",
						},
						{
							name = "My PRs",
							key = "2",
							layout = "plain",
							search = "is:open author:@me sort:updated-desc",
						},
						{
							name = "This repo",
							key = "3",
							layout = "plain",
							current_repo = true,
							search = "is:open sort:updated-desc",
						},
					},
				},
			},
		},
	},
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Glog", "Gdiffsplit", "GBlame", "GBrowse" },
		dependencies = { "tpope/vim-rhubarb" },
		keys = {
			{ "<leader>gs", ":ToggleGStatus<CR>", desc = "Toggle git status" },
			{ "<Leader>gd", ":tab Gdiffsplit<CR>", desc = "Git diff split" },
			{ "<Leader>gD", ":Git difftool<CR>", desc = "Git diff tool" },
			{ "<Leader>gdl", ":diffget //3<CR>", desc = "Git diff get local //3" },
			{ "<Leader>gdh", ":diffget //2<CR>", desc = "Git diff get remote //2" },
		},
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
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
		dependencies = {
			"tpope/vim-fugitive",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		branch = "main",
		config = function()
			require("gitsigns").setup({
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
					map("n", "ghd", gs.diffthis, { desc = "Diff This" })
					map("n", "ghD", function()
						gs.diffthis("~")
					end, { desc = "Diff This ~" })

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
		"esmuellert/codediff.nvim",
		cmd = "CodeDiff",
		opts = {},
	},
	{
		"dlyongemallo/diffview.nvim",
		version = "*",
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true, -- Better syntax highlighting inside the diffs
				use_icons = true, -- Requires a Nerd Font for visual file tree anchors
				file_panel = {
					listing_style = "tree",
					win_config = {
						position = "bottom",
						height = 25,
					},
				},
			})
		end,
	},
}

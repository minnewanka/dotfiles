local Hydra = require("hydra")
local gitsigns = require("gitsigns")

local function cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

local hint = [[
 _j_: next hunk   _s_: stage hunk        _d_: show deleted      _2_: diffget Left        _b_: blame line
 _k_: prev hunk   _u_: undo last stage   _p_: preview hunk      _3_: diffget Right        
 ^
 ^ ^              _l_: Lazygit          _<Enter>_: Fugitive              _q_: exit
]]

Hydra({
	name = "Git",
	hint = hint,
	config = {
		buffer = bufnr,
		color = "red",
		invoke_on_body = true,
		hint = {
			border = "rounded",
		},
		on_key = function()
			vim.wait(50)
		end,
		on_enter = function()
			vim.cmd("silent! %foldopen!")
			gitsigns.toggle_linehl(true)
		end,
		on_exit = function()
			gitsigns.toggle_linehl(false)
		end,
	},
	mode = { "n", "x" },
	body = "<leader>g",
	heads = {
		{
			"j",
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gitsigns.next_hunk()
				end)
				return "<Ignore>"
			end,
			{ expr = true, desc = "next hunk" },
		},
		{
			"k",
			function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gitsigns.prev_hunk()
				end)
				return "<Ignore>"
			end,
			{ expr = true, desc = "prev hunk" },
		},
		{
			"s",
			function()
				local mode = vim.api.nvim_get_mode().mode:sub(1, 1)
				if mode == "V" then -- visual-line mode
					local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
					vim.api.nvim_feedkeys(esc, "x", false) -- exit visual mode
					vim.cmd("'<,'>Gitsigns stage_hunk")
				else
					vim.cmd("Gitsigns stage_hunk")
				end
			end,
			{ desc = "stage hunk" },
		},
		{ "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
		{ "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
		{ "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
		{ "b", gitsigns.blame_line, { desc = "blame" } },
		{ "l", cmd("LazyGit"), { exit = true } },
		{ "2", cmd("diffget //2"), { exit = true } },
		{ "3", cmd("diffget //3"), { exit = true } },
		{ "<Enter>", cmd("ToggleGStatus"), { exit = true } },
		{ "q", nil, { exit = true, nowait = true, desc = "exit" } },
	},
})

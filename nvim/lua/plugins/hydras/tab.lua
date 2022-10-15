local Hydra = require("hydra")

local function cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

local hint = [[
 _n_: new tab       _o_: only tab       _c_:  close Tob
 _j_: next tab      _k_: previous tab   
]]

Hydra({
	name = "Tab",
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
	},
	mode = { "n" },
	body = "<leader>t",
	heads = {
		{ "n", cmd(":tabnew %<CR>"), { exit = true } },
		{ "o", cmd(":tabonly<CR>"), { exit = true } },
		{ "c", cmd(":tabclose<CR>"), { exit = true } },
		{ "j", "gt" },
		{ "k", "gT" },
		{ "q", nil, { exit = true, nowait = true, desc = "exit" } },
		{ "<Enter>", nil, { exit = true, nowait = true, desc = "exit" } },
	},
})

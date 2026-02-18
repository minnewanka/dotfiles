local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--remap toggle file
map("n", "<BS>", "<C-^>", { noremap = true, silent = true, desc = "Toggle file" })

map("n", "Q", "q", { noremap = true, silent = true, desc = "Disable ex mode" })

-- selection
map("i", "<C-j>", "<C-n>", { noremap = true, silent = true, desc = "Completion next" })
map("i", "<C-k>", "<C-p>", { noremap = true, desc = "Completion prev" })

map(
	"c",
	"<C-k>",
	'pumvisible() ? "<C-p>" : "<C-k>"',
	{ noremap = true, expr = true, silent = false, desc = "Completion prev" }
)
map(
	"c",
	"<C-j>",
	'pumvisible() ? "<C-n>" : "<C-j>"',
	{ noremap = true, expr = true, silent = false, desc = "Completion next" }
)
map(
	"c",
	"<Up>",
	'pumvisible() ? "<C-p>" : "<Up>"',
	{ noremap = true, expr = true, silent = false, desc = "Completion prev" }
)
map(
	"c",
	"<Down>",
	'pumvisible() ? "<C-n>" : "<Down>"',
	{ noremap = true, expr = true, silent = false, desc = "Completion next" }
)

-- hlsearch
map("n", "ghl", ":noh<CR>", { noremap = true, silent = true, desc = "Clear highlight" })

-- save & quit
map("n", "<Leader>w", "<cmd>qa!<CR>", { noremap = true, silent = false, desc = "Quit all" })
map("n", "<Leader>q", "<cmd>q!<CR>", { noremap = true, silent = false, desc = "Quit" })
map("n", "<Leader>z", "<cmd>wq<CR>", { noremap = true, silent = true, desc = "Save and quit" })

-- line text object
map("x", "il", "g_o^", { noremap = true, silent = true, desc = "Inside line" })
map("o", "il", ":normal vil<CR>", { noremap = true, silent = true, desc = "Inside line" })
map("x", "al", "$o0", { noremap = true, silent = true, desc = "Around line" })
map("o", "al", ":normal val<CR>", { noremap = true, silent = true, desc = "Around line" })

vim.keymap.set("n", "k", [[(v:count > 1 ? "m'" . v:count : "g") . 'k']], { expr = true, desc = "Move up" })
vim.keymap.set("n", "j", [[(v:count > 1 ? "m'" . v:count : "g") . 'j']], { expr = true, desc = "Move down" })

-- git diff
map("n", "<leader>gs", ":ToggleGStatus<CR>", { noremap = true, silent = true, desc = "Toggle git status" })
map("n", "<Leader>gd", ":tab Gdiffsplit<CR>", { noremap = true, silent = true, desc = "Git diff split" })
map("n", "<Leader>gD", ":Git difftool<CR>", { noremap = true, silent = true, desc = "Git diff tool" })
map("n", "<Leader>gdl", ":diffget //3<CR>", { noremap = true, silent = true, desc = "Git diff get local //3" })
map("n", "<Leader>gdh", ":diffget //2<CR>", { noremap = true, silent = true, desc = "Git diff get remote //2" })

-- Tab
map(
	"i",
	"<TAB>",
	"luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump':'<Tab>'",
	{ expr = true, silent = true, desc = "Luasnip expand or jump" }
)
map("i", "<S-TAB>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", { silent = true, desc = "ump back" })

-- reselect map
map(
	"n",
	"gy",
	"'`[' . strpart(getregtype(), 0, 1) . '`]'",
	{ noremap = true, expr = true, silent = true, desc = "Reselect" }
)

--marks
map("n", "`", "'", { noremap = true, silent = true, desc = "Go to mark" })
map("n", "'", "`", { noremap = true, silent = true, desc = "Go to mark" })

-- snacks picker
local kmap = vim.keymap.set
kmap("n", "<leader>M", function() Snacks.picker.marks() end, { noremap = true, silent = true, desc = "Snacks marks" })
kmap("n", "<Leader>b", function() Snacks.picker.buffers() end, { noremap = true, silent = true, desc = "Snacks buffers" })
kmap("n", "<Leader>f", function() Snacks.picker.grep() end, { noremap = true, silent = true, desc = "Snacks live grep" })
kmap("n", "<Leader>fs", function() Snacks.picker.grep_word() end, { noremap = true, silent = true, desc = "Snacks grep word under cursor" })
kmap("v", "<Leader>fs", function() Snacks.picker.grep_word() end, { noremap = true, silent = true, desc = "Snacks grep visual selection" })
kmap("n", "<Leader>fo", function() Snacks.picker.recent() end, { noremap = true, silent = true, desc = "Snacks recent files" })
kmap("n", "<Leader>/", function() Snacks.picker.lines() end, { noremap = true, silent = true, desc = "Snacks buffer lines" })
kmap("n", "<Leader>sd", function() Snacks.picker.grep() end, { noremap = true, silent = true, desc = "Snacks live grep (glob)" })
map("n", "<leader>cc", "<cmd>ClaudeCode<CR>", { noremap = true, silent = true, desc = "Toggle Claude Code" })
--undo break point
map("i", ",", ",<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })
map("i", ".", ".<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })
map("i", "!", "!<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })
map("i", "?", "?<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })

map("n", "<F1>", ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true, desc = "DAP toggle breakpoint" })
map("n", "<F2>", ':lua require"dap".continue()<CR>', { noremap = true, desc = "DAP continue" })

map(
	"n",
	"<leader>=",
	':exe "vertical resize " . (winwidth(0) * 3/2)<CR>',
	{ noremap = true, silent = true, desc = "Increase window width" }
)
map(
	"n",
	"<leader>-",
	':exe "vertical resize " . (winwidth(0) * 2/3)<CR>',
	{ noremap = true, silent = true, desc = "Decrease window width" }
)
kmap("n", "<leader>fr", function() Snacks.picker.resume() end, { noremap = true, silent = true, desc = "Snacks resume" })

-- HlsLens
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

map(
	"n",
	"<Left>",
	":lua require('bufjump').backward()<CR>",
	{ noremap = true, silent = true, desc = "Bufjump backward" }
)
map(
	"n",
	"<Right>",
	":lua require('bufjump').forward()<CR>",
	{ noremap = true, silent = true, desc = "Bufjump forward" }
)
map(
	"n",
	"<M-o>",
	":lua require('bufjump').backward_same_buf()<cr>",
	{ noremap = true, silent = true, desc = "Bufjump backward same buf" }
)
map(
	"n",
	"<M-i>",
	":lua require('bufjump').forward_same_buf()<cr>",
	{ noremap = true, silent = true, desc = "Bufjump forward same buf" }
)

-- tab
map("n", "<leader>tn", ":tabnew %<CR>", { noremap = true, silent = true, desc = "New tab" })
map("n", "<leader>to", ":tabonly<CR>", { noremap = true, silent = true, desc = "Tab only" })
map("n", "<leader>tq", ":tabclose<CR>", { noremap = true, silent = true, desc = "Tab close" })
map("n", "<leader>tr", ":TabRename ", { noremap = true, silent = true, desc = "Tab rename" })

-- unimpaired alternatives
-- Quickfix list
vim.keymap.set("n", "<C-q>", function()
	-- close current win if there are more than 1 win
	-- else close current tab if there are more than 1 tab
	-- else close current vim
	if #vim.api.nvim_tabpage_list_wins(0) > 1 then
		vim.cmd([[close]])
	elseif #vim.api.nvim_list_tabpages() > 1 then
		vim.cmd([[tabclose]])
	else
		vim.cmd([[qa]])
	end
end, { desc = "Super <C-q>" })

map("n", "<leader>p", "<Nop>", { noremap = true, silent = true, desc = "Temporary keymap to unlearn muscle memory" })

vim.keymap.set("t", "<M-n>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

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

--undo break point
map("i", ",", ",<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })
map("i", ".", ".<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })
map("i", "!", "!<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })
map("i", "?", "?<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })

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

-- tab
map("n", "<leader>tn", ":tabnew %<CR>", { noremap = true, silent = true, desc = "New tab" })
map("n", "<leader>to", ":tabonly<CR>", { noremap = true, silent = true, desc = "Tab only" })
map("n", "<leader>tq", ":tabclose<CR>", { noremap = true, silent = true, desc = "Tab close" })

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

vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

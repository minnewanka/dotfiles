vim.g.mapleader = " "
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

map(
	"n",
	"<leader>T",
	":lua vim.lsp.diagnostic.set_loclist()<CR>",
	{ noremap = true, silent = true, desc = "LSP set loclist" }
)

-- line text object
map("x", "il", "g_o^", { noremap = true, silent = true, desc = "Inside line" })
map("o", "il", ":normal vil<CR>", { noremap = true, silent = true, desc = "Inside line" })
map("x", "al", "$o0", { noremap = true, silent = true, desc = "Around line" })
map("o", "al", ":normal val<CR>", { noremap = true, silent = true, desc = "Around line" })

vim.keymap.set("n", "k", [[(v:count > 1 ? "m'" . v:count : "g") . 'k']], { expr = true, desc = "Move up" })
vim.keymap.set("n", "j", [[(v:count > 1 ? "m'" . v:count : "g") . 'j']], { expr = true, desc = "Move down" })

-- git diff
map("n", "<leader>gf", ":ToggleGStatus<CR>", { noremap = true, silent = true, desc = "Toggle git status" })
map("n", "<Leader>gd", ":Gdiffsplit<CR>", { noremap = true, silent = true, desc = "Git diff split" })
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

-- Telescope
map("n", "<leader>M", [[<Cmd>Telescope marks<CR>]], { noremap = true, silent = true, desc = "Telescope marks" })
map(
	"n",
	"<Leader>b",
	[[<Cmd>Telescope buffers initial_mode=insert<CR>]],
	{ noremap = true, silent = true, desc = "Telescope buffers" }
)
map("n", "<Leader>f", [[<Cmd>Telescope live_grep<CR>]], { noremap = true, silent = true, desc = "Telescope live grep" })
map(
	"n",
	"<Leader>fs",
	[[<Cmd>Telescope grep_string<CR>]],
	{ noremap = true, silent = true, desc = "Telescope grep string" }
)
map(
	"v",
	"<Leader>fs",
	[[<Cmd>Telescope grep_string<CR>]],
	{ noremap = true, silent = true, desc = "Telescope grep string" }
)
map("n", "<Leader>fo", [[<Cmd>Telescope oldfiles<CR>]], { noremap = true, silent = true, desc = "Telescope old files" })
map(
	"n",
	"<C-p>",
	[[<Cmd>Telescope smart_open cwd_only=true theme=dropdown previewer=false <CR>]],
	{ noremap = true, silent = true, desc = "Telescope smart open" }
)
map(
	"n",
	"<Leader>/",
	[[<Cmd>Telescope current_buffer_fuzzy_find<CR>]],
	{ noremap = true, silent = true, desc = "Telescope current buffer fuzzy find" }
)
map(
	"n",
	"<Leader>sd",
	[[<Cmd>:lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]],
	{ noremap = true, silent = true, desc = "Telescope live grep args" }
)
map(
	"n",
	"<leader>cc",
	[[<Cmd>lua require("telescope").extensions.neoclip.default()<CR>]],
	{ noremap = true, silent = true, desc = "Telescope neoclip" }
)
--undo break point
map("i", ",", ",<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })
map("i", ".", ".<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })
map("i", "!", "!<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })
map("i", "?", "?<c-g>u", { noremap = true, silent = true, desc = "Undo break point" })

map("n", "<F1>", ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true, desc = "DAP toggle breakpoint" })
map("n", "<F2>", ':lua require"dap".continue()<CR>', { noremap = true, desc = "DAP continue" })

map(
	"n",
	"<leader>k",
	':exe "resize " . (winheight(0) * 3/2)<CR>',
	{ noremap = true, silent = true, desc = "Increase window height" }
)
map(
	"n",
	"<leader>j",
	':exe "resize " . (winheight(0) * 2/3)<CR>',
	{ noremap = true, silent = true, desc = "Decrease window height" }
)
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume, { desc = "Telescope resume" })

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

--  Center stuff
map("n", "n", "nzz", { noremap = true, silent = true, desc = "Center next search" })
map("n", "N", "Nzz", { noremap = true, silent = true, desc = "Center prev search" })
map("n", "*", "*zz", { noremap = true, silent = true, desc = "Center next search" })
map("n", "#", "#zz", { noremap = true, silent = true, desc = "Center prev search" })

-- tab
map("n", "<leader>tn", ":tabnew %<CR>", { noremap = true, silent = true, desc = "New tab" })
map("n", "<leader>to", ":tabonly<CR>", { noremap = true, silent = true, desc = "Tab only" })
map("n", "<leader>tq", ":tabclose<CR>", { noremap = true, silent = true, desc = "Tab close" })
map("n", "<leader>tr", ":TabRename ", { noremap = true, silent = true, desc = "Tab rename" })

-- unimpaired alternatives
-- Quickfix list
map("n", ",qn", ":cnext<CR>", { noremap = true, silent = true, desc = "Quickfix next" })
map("n", ",qp", ":cprev<CR>", { noremap = true, silent = true, desc = "Quickfix prev" })
map("n", ",qo", ":copen<CR>", { noremap = true, silent = true, desc = "Quickfix open" })
map("n", ",qc", ":cclose<CR>", { noremap = true, silent = true, desc = "Quickfix close" })

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

map("n", "ghl", ":noh<CR>", { noremap = true, silent = true, desc = "Clear highlight" })

map("n", "<leader>p", "<Nop>", { noremap = true, silent = true, desc = "Temporary keymap to unlearn muscle memory" })

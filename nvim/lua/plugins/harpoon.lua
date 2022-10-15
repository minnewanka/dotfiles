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

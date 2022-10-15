require("zen-mode").setup({
	window = {
		height = 0.9,
	},
})
vim.api.nvim_set_keymap("n", ";z", ":ZenMode<CR>", { noremap = true, silent = true })

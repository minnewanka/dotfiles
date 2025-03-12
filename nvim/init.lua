vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

vim.g.gruvbox_material_foreground = "mix"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_menu_selection_background = "blue"
vim.g.gruvbox_material_float_style = "dim"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "plugins",
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
require("settings")
require("keybinding")
require("colorscheme")

vim.cmd("doautocmd ColorScheme")

vim.g.gruvbox_material_better_performance = 1

if vim.g.neovide then
	vim.o.guifont = "MonoLisa:h12"
	vim.g.neovide_input_use_logo = 1
	vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<D-s>", ":w<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<D-j>", "<C-u>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<D-k>", "<C-d>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<D-e>", ":Telescope oldfiles cwd_only=true<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<D-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
end

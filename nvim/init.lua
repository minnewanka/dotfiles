vim.opt.signcolumn = "yes"
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
-- vim.o.winborder = "rounded"

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

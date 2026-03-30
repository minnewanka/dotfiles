vim.loader.enable()
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = ";"

vim.g.gruvbox_material_background = "hard"
-- vim.g.gruvbox_material_foreground = "mix"
vim.g.gruvbox_material_menu_selection_background = "blue"
vim.g.gruvbox_material_float_style = "dim"
vim.g.gruvbox_material_better_performance = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
				"tutor",
				"zipPlugin",
			},
		},
	},
})
require("settings")
require("keybinding")
require("colorscheme")

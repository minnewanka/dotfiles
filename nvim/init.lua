vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

vim.g.gruvbox_material_foreground = "mix"
vim.g.gruvbox_material_background = "hard"

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

--neovide
if vim.g.neovide then
	vim.opt.guifont = { "MonoLisa Nerd Font", ":h12" }
	if vim.g.neovide then
		vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
		vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
		vim.keymap.set("v", "<D-c>", '"+y') -- Copy
		vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
		vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
		vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
		vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
		vim.keymap.set("n", "<D-e>", "<cmd>Telescope oldfiles cwd_only=true<CR>") -- Paste insert mode
		vim.keymap.set("n", "<D-p>", "<cmd>Telescope find_files<CR>") -- Paste insert mode
	end

	-- Allow clipboard copy paste in neovim
	vim.g.neovide_input_use_logo = 1
	vim.keymap.set("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
	vim.keymap.set("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.keymap.set("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.keymap.set("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
end

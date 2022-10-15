vim.g.gruvbox_material_foreground = "mix"
vim.g.gruvbox_material_background = "hard"

vim.g.copilot_filetypes = {
	["*"] = false,
	["javascript"] = true,
	["typescript"] = true,
	["lua"] = true,
	["html"] = true,
}

require("impatient")
require("plugins")
require("settings")
require("keybinding")
require("colorscheme")

vim.cmd("doautocmd ColorScheme")

vim.g.gruvbox_material_better_performance = 1

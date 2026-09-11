-- vim.bo, not vim.opt: `:set` writes the global value too, so a CSS buffer
-- would leak shiftwidth=2 into every file opened afterwards.
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

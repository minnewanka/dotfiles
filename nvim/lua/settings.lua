vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = ";"

local indent = 4

local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local nvim_exec = vim.api.nvim_exec
local fn, cmd = vim.fn, vim.cmd

cmd("set nomodeline")
cmd("set jumpoptions+=stack")
cmd("set inccommand=split")
cmd("set noshowmode")
cmd("set grepprg=rg\\ --vimgrep\\ --no-heading\\ --smart-case")
cmd("set grepformat=%f:%l:%c:%m")
cmd("set clipboard=unnamedplus")

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.expandtab = true
opt.termguicolors = true
opt.mouse = "a"
opt.splitbelow = true
opt.splitright = true
opt.fileencoding = "utf-8"
opt.timeout = true
opt.timeoutlen = 300
opt.smartindent = true
opt.shiftwidth = indent
opt.tabstop = indent
opt.softtabstop = indent
opt.smartcase = true
opt.ignorecase = true
opt.undofile = true
opt.updatetime = 300
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.formatoptions = vim.opt.formatoptions + { "cro" }
opt.shortmess:append("c")
opt.swapfile = false
vim.opt.shell = "/bin/bash"
opt.laststatus = 2
vim.o.winbar = "%{%v:lua.require'modules.ui.winbar'.eval()%}"
opt.fillchars:append({ eob = " " })
vim.opt.signcolumn = "yes"

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = "*",
	command = 'silent! lua vim.highlight.on_yank{higroup="YankHighlight", timeout=700}',
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = "*",
	command = "set formatoptions-=cro",
})

vim.api.nvim_create_autocmd({ "WinEnter" }, {
	command = "setlocal cursorline",
})
vim.api.nvim_create_autocmd({ "WinLeave" }, {
	command = "setlocal nocursorline",
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	command = "highlight CursorLine guibg=#374141",
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	command = "highlight CursorLine guibg=#32302f",
})

vim.api.nvim_create_user_command("BufOnly", 'silent! execute "%bd|e#|bd#"', {})
vim.api.nvim_create_user_command("TSFix", ":write | edit | TSBufEnable highlight", {})
vim.api.nvim_create_user_command("PrAll", ":Octo search archived:false is:pr state:open", {})
vim.api.nvim_create_user_command("Pr", ":Octo search archived:false is:pr state:open review-requested:minnewanka", {})
vim.api.nvim_create_user_command("MyPr", ":Octo search assignee:minnewanka is:pr", {})


-- auto save
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	callback = function()
		if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
			vim.api.nvim_command("silent update")
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		vim.keymap.set("n", "grd", vim.lsp.buf.definition, { noremap = true, silent = true, buffer = bufnr })
		vim.keymap.set("n", "gry", vim.lsp.buf.incoming_calls, { noremap = true, silent = true, buffer = bufnr })
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({
				border = "rounded",
			})
		end, { buffer = event.buf })
	end,
})

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
vim.api.nvim_create_user_command("Pr", ":Octo search archived:false is:pr state:open review-requested:minnewanka", {})
vim.api.nvim_create_user_command("MyPr", ":Octo search assignee:minnewanka is:pr", {})

vim.api.nvim_create_user_command("ToggleGStatus", function()
	if vim.fn.buflisted(vim.fn.bufname(".git/index")) ~= 0 then
		vim.cmd("bd .git/index")
	else
		vim.cmd("Git")
	end
end, {})

-- quit if nvimtree last window
-- vim.api.nvim_create_autocmd("QuitPre", {
-- 	callback = function()
-- 		local invalid_win = {}
-- 		local wins = vim.api.nvim_list_wins()
-- 		for _, w in ipairs(wins) do
-- 			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
-- 			if bufname:match("NvimTree_") ~= nil then
-- 				table.insert(invalid_win, w)
-- 			end
-- 		end
-- 		if #invalid_win == #wins - 1 then
-- 			-- Should quit, so we close all invalid windows.
-- 			for _, w in ipairs(invalid_win) do
-- 				vim.api.nvim_win_close(w, true)
-- 			end
-- 		end
-- 	end,
-- })

-- auto save
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	callback = function()
		if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
			vim.api.nvim_command("silent update")
		end
	end,
})

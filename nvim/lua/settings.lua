local indent = 4
local opt = vim.opt

opt.modeline = false
opt.jumpoptions = "stack"
opt.inccommand = "split"
opt.showmode = false
opt.grepprg = "rg --vimgrep --no-heading --smart-case"
opt.grepformat = "%f:%l:%c:%m"
opt.clipboard = "unnamedplus"

opt.conceallevel = 2
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.expandtab = true
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
opt.formatoptions:append("cro")
opt.shortmess:append("c")
opt.swapfile = false
opt.shell = "/bin/bash"
opt.laststatus = 2
vim.o.winbar = "%{%v:lua.require'modules.ui.winbar'.eval()%}"
opt.fillchars:append({ eob = " " })
opt.signcolumn = "yes"

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank({ higroup = "YankHighlight", timeout = 700 })
	end,
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
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
		end
		vim.keymap.set("n", "grd", vim.lsp.buf.definition, { noremap = true, silent = true, buffer = event.buf })
		vim.keymap.set("n", "gry", vim.lsp.buf.incoming_calls, { noremap = true, silent = true, buffer = event.buf })
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({
				border = "rounded",
			})
		end, { buffer = event.buf })
	end,
})

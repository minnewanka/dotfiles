local winbar = {}


local palette = require('nightfox.palette').load("nordfox")
local filename = vim.fn.fnamemodify(vim.fn.expand('%:h'), ':p:~:.')

vim.api.nvim_set_hl(0, "WinBarContent", { fg = '#bbc2cf', bold=true })

winbar.eval = function()
    f_icon, f_hl = require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype)
    f_icon = f_icon == nil and '' or (f_icon .. ' ')
      f_hl = f_hl == nil and '' or f_hl
    if vim.api.nvim_eval_statusline("%f",{})["str"] == "[No Name]" then
        return ""
    end
    return '%#' .. f_hl .. '#' .. f_icon .. '%*'
        .. vim.fn.expand('%:.')
        .. "%m"
end

return winbar

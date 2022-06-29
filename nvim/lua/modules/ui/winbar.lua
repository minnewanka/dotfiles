local winbar = {}


local palette = require('nightfox.palette').load("nordfox")
local filename = vim.fn.fnamemodify(vim.fn.expand('%:h'), ':p:~:.')

vim.api.nvim_set_hl(0, "WinBarContent", { fg = palette.fg1, bold=true })

winbar.eval = function()
    if vim.api.nvim_eval_statusline("%f",{})["str"] == "[No Name]" then
        return ""
    end
    return  "%#WinBarContent#"
        .. vim.fn.expand('%:.')
        .. "%m"
end

return winbar

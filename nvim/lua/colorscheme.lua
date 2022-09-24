vim.api.nvim_create_autocmd("ColorScheme",
    {
        pattern = "*",
        callback = function()
            vim.api.nvim_set_hl(0, "YankHighlight", { fg="#e9b143", bg="#282828" })
            vim.api.nvim_set_hl(0, "NormalFloat", { fg="#e2cca9", bg="#282828" })
            vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { link="Red" })
            vim.api.nvim_set_hl(0, "TSProperty", { link="Green" })
            vim.api.nvim_set_hl(0, "TSConstructor", { link="Yellow" })
            vim.api.nvim_set_hl(0, "packerStatusSuccess", { link="Orange" })
        end,
    }
)


vim.cmd 'colorscheme gruvbox-material'


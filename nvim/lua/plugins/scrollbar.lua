require("scrollbar").setup()
require("scrollbar.handlers.search").setup()

require("scrollbar").setup({
    handle = {
        color = '#7e8188',
    },
    handlers = {
           diagnostic = false,
           search = true 
       },
})

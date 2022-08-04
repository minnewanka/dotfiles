local groups = {
  all = {
    IncSearch = {  bg = "palette.cyan" },
    YankHighlight = { fg = '#3e4a5b', bg = "palette.green" },
  },
}
require('nightfox').setup({
  groups = groups,
})

vim.cmd 'colorscheme nordfox'

vim.opt.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'always';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
      path = true;
      buffer = true;
      nvim_lsp = true;
      nvim_lua = true;
      vsnip = true;
      tags = true;
  };
}

-- mappings
vim.api.nvim_set_keymap('i', '<CR>', "compe#confirm('<CR>')", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-Space>', "compe#complete()", { noremap = true, expr = true, silent = true })


function _G.completions()
    local npairs = require("nvim-autopairs")
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

vim.api.nvim_set_keymap("i", "<CR>", "v:lua.completions()", {expr = true})

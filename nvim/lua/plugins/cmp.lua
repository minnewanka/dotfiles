local lspkind = require('lspkind')
local cmp = require'cmp'
local check_back_space = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
cmp.setup({
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            })[entry.source.name]
            return vim_item
        end,
    },

    snippet = {
        expand = function(args)
            local luasnip = require("luasnip")
            if not luasnip then
                return
            end
            luasnip.lsp_expand(args.body)
        end,
    },
     mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
    },
 window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
})

-- Use buffer source for `/`.
--[[ cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
}) ]]


--[[ require'cmp'.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
}) ]]

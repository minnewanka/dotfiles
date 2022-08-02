local Hydra = require("hydra")
local splits = require('smart-splits')

local function cmd(command)
   return table.concat({ '<Cmd>', command, '<CR>' })
end

local hint = [[
 _<C-h>_: resize left      _<C-j>_: resize down       _<C-k>_: resize up       _<C-l>_:  resize right
 _s_: horizontally         _v_: vertically
]]

Hydra({
    name = 'Windows',
    hint = window_hint,
    config = {
        invoke_on_body = true,
        hint = {
            border = 'rounded',
            offset = -1
        }
    },
    mode = 'n',
    body = '<C-w>',
    heads = {
        { 's', '<C-w>s' }, { '<C-s>', '<C-w><C-s>', { desc = false } },
        { 'v', '<C-w>v' }, { '<C-v>', '<C-w><C-v>', { desc = false } },
        { '<C-h>', function() splits.resize_left(2)  end },
        { '<C-j>', function() splits.resize_down(2)  end },
        { '<C-k>', function() splits.resize_up(2)    end },
        { '<C-l>', function() splits.resize_right(2) end },
        { '<Esc>', nil,  { exit = true, desc = false }}
    }
})

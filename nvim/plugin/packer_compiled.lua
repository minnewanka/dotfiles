-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/philippe/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/philippe/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/philippe/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/philippe/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/philippe/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    after = { "cmp_luasnip" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.luasnip\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/LuaSnip"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.navigator\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/Navigator.nvim"
  },
  bufexplorer = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/bufexplorer"
  },
  ["cmp-buffer"] = {
    after_files = { "/Users/philippe/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/Users/philippe/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/Users/philippe/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  cmp_luasnip = {
    after_files = { "/Users/philippe/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.feline\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14gitlinker\frequire\0" },
    keys = { { "", "<leader>gy" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.harpoon\frequire\0" },
    keys = { { "", "<leader>h" }, { "", "<leader>a" }, { "", "<leader>1" }, { "", "<leader>2" }, { "", "<leader>3" }, { "", "<leader>4" }, { "", "<leader>5" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/harpoon"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  kommentary = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.lightspeed\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/lightspeed.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n^\0\0\5\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0005\3\4\0005\4\3\0=\4\5\3>\3\1\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\1\tprev\amp\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/marks.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-bqf"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lsp", "cmp-nvim-lua", "cmp-buffer", "nvim-autopairs", "LuaSnip" },
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerToggle" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.hlslens\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-hlslens"
  },
  ["nvim-jdtls"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rlsp.java\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nW\0\0\3\0\4\0\n6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\17lsp/tsserver\flsp/efm\15lsp/config\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.spectre\frequire\0" },
    keys = { { "", "<leader>s" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.nvimtree\frequire\0" },
    keys = { { "", "<leader>e" }, { "", "<leader>n" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-autotag" },
    loaded = true,
    only_config = true
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    commands = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["tabby.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ntabby\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/tabby.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.toggleterm\frequire\0" },
    keys = { { "", "<leader>g" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.undotree\frequire\0" },
    keys = { { "", "<leader>u" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "Glog", "Gdiffsplit", "GBlame" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/vim-surround"
  },
  ["winshift.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.winshift\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/winshift.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.zenmode\frequire\0" },
    keys = { { "", ";z" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.feline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\5\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0005\3\4\0005\4\3\0=\4\5\3>\3\1\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\1\tprev\amp\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: nvim-jdtls
time([[Config for nvim-jdtls]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rlsp.java\frequire\0", "config", "nvim-jdtls")
time([[Config for nvim-jdtls]], false)
-- Config for: tabby.nvim
time([[Config for tabby.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ntabby\frequire\0", "config", "tabby.nvim")
time([[Config for tabby.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\n6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\17lsp/tsserver\flsp/efm\15lsp/config\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glog lua require("packer.load")({'vim-fugitive'}, { cmd = "Glog", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBlame lua require("packer.load")({'vim-fugitive'}, { cmd = "GBlame", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>4 <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>4", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>s <cmd>lua require("packer.load")({'nvim-spectre'}, { keys = "<lt>leader>s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>h <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>h", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ;z <cmd>lua require("packer.load")({'zen-mode.nvim'}, { keys = ";z", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>5 <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>5", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>3 <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>3", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>2 <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>2", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>1 <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>1", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>e <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>e", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>u <cmd>lua require("packer.load")({'undotree'}, { keys = "<lt>leader>u", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>a <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>a", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>gy <cmd>lua require("packer.load")({'gitlinker.nvim'}, { keys = "<lt>leader>gy", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>n <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>g <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>leader>g", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'kommentary', 'nvim-ts-autotag', 'Navigator.nvim', 'vim-fugitive', 'vim-surround', 'winshift.nvim', 'gitsigns.nvim', 'lightspeed.nvim', 'nvim-cmp', 'nvim-bqf', 'nvim-hlslens'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

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
    config = { "\27LJ\2\n∆\1\0\0\5\0\b\0\0176\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0019\2\4\0025\4\5\0B\2\2\0016\2\1\0'\4\6\0B\2\2\0029\2\a\2B\2\1\1K\0\1\0\tload luasnip/loaders/from_vscode\1\0\2\fhistory\2\17updateevents\29TextChanged,TextChangedI\15set_config\vconfig\fluasnip\frequire\npcall\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/LuaSnip"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\n∫\3\0\0\b\0\17\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\1\a\0\18\2\0\0'\4\b\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\b\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\b\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\1\18\2\0\0'\4\b\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\1K\0\1\0-<CMD>lua require('Navigator').down()<CR>\n<C-j>.<CMD>lua require('Navigator').right()<CR>\n<C-l>+<CMD>lua require('Navigator').up()<CR>\n<C-k>-<CMD>lua require('Navigator').left()<CR>\n<C-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\1\0\2\14auto_save\fcurrent\20disable_on_zoom\2\nsetup\14Navigator\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/Navigator.nvim"
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
    config = { "\27LJ\2\n¯\6\0\0\6\0!\0U5\0\0\0005\1\1\0004\2\0\0=\2\2\0014\2\0\0=\2\3\0016\2\4\0009\2\5\0029\4\2\0014\5\0\0B\2\3\0016\2\4\0009\2\5\0029\4\2\0014\5\0\0B\2\3\0016\2\4\0009\2\5\0029\4\2\0014\5\0\0B\2\3\0016\2\4\0009\2\5\0029\4\3\0014\5\0\0B\2\3\0019\2\2\1:\2\1\0025\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\3>\3\1\0029\2\2\1:\2\1\0025\3\v\0>\3\2\0029\2\2\1:\2\1\0025\3\f\0005\4\r\0=\4\14\3>\3\3\0029\2\2\1:\2\1\0025\3\15\0005\4\16\0=\4\14\3>\3\4\0029\2\2\1:\2\1\0025\3\17\0005\4\18\0=\4\14\3>\3\5\0029\2\2\1:\2\3\0025\3\19\0005\4\20\0=\4\21\3>\3\1\0029\2\2\1:\2\3\0025\3\22\0>\3\2\0029\2\3\1:\2\1\0025\3\25\0005\4\23\0005\5\24\0=\5\b\4=\4\n\0035\4\26\0=\4\14\3>\3\1\0026\2\27\0'\4\28\0B\2\2\0029\2\29\0025\4\30\0=\0\31\4=\1 \4B\2\2\1K\0\1\0\15components\vcolors\1\0\0\nsetup\vfeline\frequire\1\0\2\abg\f#3a3735\afg\f#A89985\1\0\2\rleft_sep\6 \rprovider\14file_info\1\0\1\ttype\vunique\1\0\1\tname\14file_info\1\0\3\rleft_sep\6 \14right_sep\6 \rprovider\20line_percentage\14right_sep\1\0\1\bstr\6 \1\0\1\rprovider\rposition\1\0\1\afg\f#F2584A\1\0\1\rprovider\21git_diff_removed\1\0\1\afg\f#7EA99D\1\0\1\rprovider\21git_diff_changed\ahl\1\0\1\afg\f#B1B946\1\0\2\rleft_sep\6 \rprovider\19git_diff_added\1\0\3\rleft_sep\6 \14right_sep\6 \rprovider\15git_branch\rprovider\1\0\2\rleft_sep\6 \14right_sep\6 \topts\1\0\1\ttype\vunique\1\0\1\tname\14file_info\vinsert\ntable\rinactive\vactive\1\0\0\1\0\2\abg\f#3b4439\afg\f#E2CBA7\0" },
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
    config = { "\27LJ\2\nÃ\6\0\0\6\0\30\0A6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\28\0'\4\26\0005\5\29\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\14<leader>5\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(4)<CR>\14<leader>4\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(3)<CR>\14<leader>3\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(2)<CR>\14<leader>2\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(1)<CR>\14<leader>1\1\0\2\vsilent\2\fnoremap\0024<Cmd>lua require(\"harpoon.mark\").add_file()<CR>\14<leader>a\1\0\2\vsilent\2\fnoremap\2;<Cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>\14<leader>h\6n\20nvim_set_keymap\bapi\bvim\tmenu\1\0\0\1\0\2\nwidth\3P\vheight\3\b\nsetup\fharpoon\frequire\0" },
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
    config = { "\27LJ\2\nÖ\2\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\a\21limit_ft_matches\3\5+match_only_the_start_of_same_char_seqs\2\25grey_out_search_area\2\27highlight_unique_chars\1)jump_on_partial_input_safety_timeout\3ê\3\24jump_to_first_match\2\30full_inclusive_prefix_key\n<c-x>\nsetup\15lightspeed\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/lightspeed.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["luatab.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/luatab.nvim"
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
    after = { "cmp-buffer", "cmp-nvim-lsp", "cmp-nvim-lua", "LuaSnip", "nvim-autopairs" },
    config = { "\27LJ\2\nõ\1\0\0\6\0\b\2\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\18Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0F\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim‹\1\0\2\5\0\n\0\0176\2\1\0'\4\2\0B\2\2\0029\2\3\0029\2\4\0029\3\0\0018\2\3\2'\3\5\0009\4\0\1&\2\4\2=\2\0\0015\2\a\0009\3\b\0009\3\t\0038\2\3\2=\2\6\1L\1\2\0\tname\vsource\1\0\5\rnvim_lsp\n[LSP]\fluasnip\14[LuaSnip]\vbuffer\r[Buffer]\18latex_symbols\f[Latex]\rnvim_lua\n[Lua]\tmenu\6 \fdefault\fpresets\flspkind\frequire\tkindO\0\1\5\0\4\0\n6\1\0\0'\3\1\0B\1\2\2\14\0\1\0X\2\1ÄK\0\1\0009\2\2\0019\4\3\0B\2\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireï\3\1\0\v\0\28\0'6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0003\3\4\0009\4\5\0015\6\a\0005\a\6\0=\a\b\0065\a\n\0003\b\t\0=\b\v\a=\a\f\0065\a\14\0003\b\r\0=\b\15\a=\a\16\0065\a\20\0009\b\17\0019\b\18\b5\n\19\0B\b\2\2=\b\21\a=\a\17\0064\a\4\0005\b\22\0>\b\1\a5\b\23\0>\b\2\a5\b\24\0>\b\3\a=\a\25\0065\a\26\0=\a\27\6B\4\2\1K\0\1\0\18documentation\1\0\1\vborder\vsingle\fsources\1\0\1\tname\rnvim_lsp\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\fmapping\fsnippet\vexpand\1\0\0\0\15formatting\vformat\1\0\0\0\15completion\1\0\0\1\0\1\16completeopt\26menu,menuone,noinsert\nsetup\0\0\bcmp\flspkind\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerToggle" },
    config = { "\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\bcss\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\vcss_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
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
    config = { "\27LJ\2\no\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\23nearest_float_when\valways\17nearest_only\2\14calm_down\2\nsetup\fhlslens\frequire\0" },
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
    config = { "\27LJ\2\n¥\1\0\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2+<Cmd>lua require('spectre').open()<CR>\14<Leader>s\6n\20nvim_set_keymap\bapi\bvim\nsetup\fspectre\frequire\0" },
    keys = { { "", "<leader>s" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÎ\4\0\0\n\0\30\00096\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\n\0005\4\5\0004\5\3\0005\6\6\0\18\a\0\0'\t\a\0B\a\2\2=\a\b\6>\6\1\5=\5\t\4=\4\v\3B\1\2\0016\1\f\0009\1\r\1)\2\0\0=\2\14\0016\1\f\0009\1\r\1)\2\0\0=\2\15\0016\1\f\0009\1\r\0015\2\17\0=\2\16\0016\1\f\0009\1\r\1'\2\19\0=\2\18\0016\1\f\0009\1\r\1)\2\1\0=\2\20\0016\1\f\0009\1\21\0019\1\22\1'\3\23\0'\4\24\0'\5\25\0005\6\26\0B\1\5\0016\1\f\0009\1\21\0019\1\22\1'\3\23\0'\4\27\0'\5\28\0005\6\29\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\26:NvimTreeFindFile<CR>\14<Leader>n\1\0\2\vsilent\2\fnoremap\2\24:NvimTreeToggle<CR>\14<Leader>e\6n\20nvim_set_keymap\bapi\29nvim_tree_indent_markers\fasdfjkl\"nvim_tree_window_picker_chars\1\0\3\nfiles\3\1\ffolders\3\1\bgit\3\0\25nvim_tree_show_icons\24nvim_tree_gitignore\21nvim_tree_git_hl\6g\bvim\tview\1\0\0\fmapping\acb\acd\1\0\1\bkey\n<C-g>\1\0\1\nwidth\0037\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    keys = { { "", "<leader>e" } },
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
    config = { "\27LJ\2\nô\1\0\1\b\0\n\0\0146\1\0\0009\1\1\1'\3\2\0B\1\2\0016\1\0\0009\1\3\0019\1\4\0019\3\5\0'\4\6\0'\5\a\0'\6\b\0005\a\t\0B\1\6\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\19<cmd>close<CR>\6q\6n\nbufnr\24nvim_buf_set_keymap\bapi\17startinsert!\bcmd\bvim4\0\1\4\0\3\0\0056\1\0\0009\1\1\1'\3\2\0B\1\2\1K\0\1\0\21Closing terminal\bcmd\bvim$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\1¿\vtoggle⁄\2\1\0\b\0\20\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\3\0\0009\1\3\0005\4\4\0005\5\5\0=\5\6\0043\5\a\0=\5\b\0043\5\t\0=\5\n\4B\1\3\0023\2\v\0007\2\f\0006\2\r\0009\2\14\0029\2\15\2'\4\16\0'\5\17\0'\6\18\0005\a\19\0B\2\5\0012\0\0ÄK\0\1\0\1\0\2\vsilent\2\fnoremap\2#<cmd>lua _lazygit_toggle()<CR>\14<leader>g\6n\20nvim_set_keymap\bapi\bvim\20_lazygit_toggle\0\ron_close\0\fon_open\0\15float_opts\1\0\1\vborder\vdouble\1\0\3\bdir\fgit_dir\bcmd\flazygit\14direction\nfloat\bnew\rTerminal\24toggleterm.terminal\frequire\0" },
    keys = { { "", "<leader>g" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "\27LJ\2\n√\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\a\0)\1\2\0=\1\b\0006\0\0\0009\0\a\0)\0012\0=\1\t\0K\0\1\0\24undotree_SplitWidth\26undotree_WindowLayout\6g\1\0\2\vsilent\2\fnoremap\2\24:UndotreeToggle<CR>\14<leader>u\6n\20nvim_set_keymap\bapi\bvim\0" },
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
  ["vim-signature"] = {
    after_files = { "/Users/philippe/.local/share/nvim/site/pack/packer/opt/vim-signature/after/plugin/signature.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/vim-signature"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/vim-surround"
  },
  ["winshift.nvim"] = {
    config = { "\27LJ\2\nù\2\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\18:WinShift<CR>\v<C-W>m\6n\20nvim_set_keymap\bapi\bvim\23moving_win_options\1\0\4\15cursorline\1\twrap\1\17cursorcolumn\1\16colorcolumn\5\1\0\2\21focused_hl_group\15BlueVisual\25highlight_moving_win\2\nsetup\rwinshift\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/winshift.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nø\1\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\17:ZenMode<CR>\a;z\6n\20nvim_set_keymap\bapi\bvim\vwindow\1\0\0\1\0\1\vheight\4Õô≥Ê\fÃô≥ˇ\3\nsetup\rzen-mode\frequire\0" },
    keys = { { "", ";z" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-jdtls
time([[Config for nvim-jdtls]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rlsp.java\frequire\0", "config", "nvim-jdtls")
time([[Config for nvim-jdtls]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\n6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\17lsp/tsserver\flsp/efm\15lsp/config\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n¯\6\0\0\6\0!\0U5\0\0\0005\1\1\0004\2\0\0=\2\2\0014\2\0\0=\2\3\0016\2\4\0009\2\5\0029\4\2\0014\5\0\0B\2\3\0016\2\4\0009\2\5\0029\4\2\0014\5\0\0B\2\3\0016\2\4\0009\2\5\0029\4\2\0014\5\0\0B\2\3\0016\2\4\0009\2\5\0029\4\3\0014\5\0\0B\2\3\0019\2\2\1:\2\1\0025\3\t\0005\4\6\0005\5\a\0=\5\b\4=\4\n\3>\3\1\0029\2\2\1:\2\1\0025\3\v\0>\3\2\0029\2\2\1:\2\1\0025\3\f\0005\4\r\0=\4\14\3>\3\3\0029\2\2\1:\2\1\0025\3\15\0005\4\16\0=\4\14\3>\3\4\0029\2\2\1:\2\1\0025\3\17\0005\4\18\0=\4\14\3>\3\5\0029\2\2\1:\2\3\0025\3\19\0005\4\20\0=\4\21\3>\3\1\0029\2\2\1:\2\3\0025\3\22\0>\3\2\0029\2\3\1:\2\1\0025\3\25\0005\4\23\0005\5\24\0=\5\b\4=\4\n\0035\4\26\0=\4\14\3>\3\1\0026\2\27\0'\4\28\0B\2\2\0029\2\29\0025\4\30\0=\0\31\4=\1 \4B\2\2\1K\0\1\0\15components\vcolors\1\0\0\nsetup\vfeline\frequire\1\0\2\abg\f#3a3735\afg\f#A89985\1\0\2\rleft_sep\6 \rprovider\14file_info\1\0\1\ttype\vunique\1\0\1\tname\14file_info\1\0\3\rleft_sep\6 \14right_sep\6 \rprovider\20line_percentage\14right_sep\1\0\1\bstr\6 \1\0\1\rprovider\rposition\1\0\1\afg\f#F2584A\1\0\1\rprovider\21git_diff_removed\1\0\1\afg\f#7EA99D\1\0\1\rprovider\21git_diff_changed\ahl\1\0\1\afg\f#B1B946\1\0\2\rleft_sep\6 \rprovider\19git_diff_added\1\0\3\rleft_sep\6 \14right_sep\6 \rprovider\15git_branch\rprovider\1\0\2\rleft_sep\6 \14right_sep\6 \topts\1\0\1\ttype\vunique\1\0\1\tname\14file_info\vinsert\ntable\rinactive\vactive\1\0\0\1\0\2\abg\f#3b4439\afg\f#E2CBA7\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glog lua require("packer.load")({'vim-fugitive'}, { cmd = "Glog", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBlame lua require("packer.load")({'vim-fugitive'}, { cmd = "GBlame", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> ;z <cmd>lua require("packer.load")({'zen-mode.nvim'}, { keys = ";z", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>h <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>h", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>5 <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>5", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>4 <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>4", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>3 <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>3", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>2 <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>2", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>1 <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>1", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>g <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>leader>g", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>gy <cmd>lua require("packer.load")({'gitlinker.nvim'}, { keys = "<lt>leader>gy", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>a <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>a", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>s <cmd>lua require("packer.load")({'nvim-spectre'}, { keys = "<lt>leader>s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>e <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>e", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>u <cmd>lua require("packer.load")({'undotree'}, { keys = "<lt>leader>u", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-hlslens', 'Navigator.nvim', 'vim-fugitive', 'vim-surround', 'nvim-cmp', 'gitsigns.nvim', 'nvim-ts-autotag', 'nvim-bqf', 'lightspeed.nvim', 'kommentary', 'vim-signature', 'winshift.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

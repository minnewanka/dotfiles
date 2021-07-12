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
  ["AutoSave.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\a\0\16\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0'\3\4\0006\4\5\0009\4\6\0049\4\a\4'\6\b\0B\4\2\2&\3\4\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\15conditions\20filetype_is_not\1\2\0\0\rfugitive\1\0\2\15modifiable\2\vexists\2\vevents\1\3\0\0\16InsertLeave\14FocusLost\22execution_message\r%H:%M:%S\rstrftime\afn\bvim\24AutoSave: saved at \1\0\4\22write_all_buffers\1\fenabled\2\20on_off_commands\2 clean_command_line_interval\3�\19\nsetup\rautosave\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/AutoSave.nvim"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\b\0\17\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\1\a\0\18\2\0\0'\4\b\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\b\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\b\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\1\18\2\0\0'\4\b\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\1K\0\1\0-<CMD>lua require('Navigator').down()<CR>\n<C-j>.<CMD>lua require('Navigator').right()<CR>\n<C-l>+<CMD>lua require('Navigator').up()<CR>\n<C-k>-<CMD>lua require('Navigator').left()<CR>\n<C-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\1\0\2\14auto_save\fcurrent\20disable_on_zoom\2\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/Navigator.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  harpoon = {
    config = { "\27LJ\2\n�\6\0\0\6\0\30\0A6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\28\0'\4\26\0005\5\29\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\14<leader>5\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(4)<CR>\14<leader>4\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(3)<CR>\14<leader>3\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(2)<CR>\14<leader>2\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(1)<CR>\14<leader>1\1\0\2\vsilent\2\fnoremap\0024<Cmd>lua require(\"harpoon.mark\").add_file()<CR>\14<leader>a\1\0\2\vsilent\2\fnoremap\2;<Cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>\14<leader>h\6n\20nvim_set_keymap\bapi\bvim\tmenu\1\0\0\1\0\2\vheight\3\b\nwidth\3P\nsetup\fharpoon\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\a+match_only_the_start_of_same_char_seqs\2\25grey_out_search_area\2\27highlight_unique_chars\1)jump_on_partial_input_safety_timeout\3�\3\24jump_to_first_match\2\30full_inclusive_prefix_key\n<c-x>\21limit_ft_matches\3\5\nsetup\15lightspeed\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lualine\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\vcss_fn\2\bcss\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.compe\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2+<Cmd>lua require('spectre').open()<CR>\14<Leader>s\6n\20nvim_set_keymap\bapi\bvim\fmapping\1\0\0\15send_to_qf\1\0\0\1\0\3\bcmd9<cmd>lua require('spectre.actions').send_to_qf()<CR>\bmap\n<C-q>\tdesc\30send all item to quickfix\nsetup\fspectre\frequire\0" },
    keys = { { "", "<leader>s" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\4\0\0\a\0\24\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0009\1\4\1'\2\6\0=\2\5\0016\1\3\0009\1\4\1)\2\0\0=\2\a\0016\1\3\0009\1\4\1)\2\0\0=\2\b\0016\1\3\0009\1\4\1)\0027\0=\2\t\0016\1\3\0009\1\4\1)\2\1\0=\2\n\0016\1\3\0009\1\4\0014\2\3\0005\3\f\0\18\4\0\0'\6\r\0B\4\2\2=\4\14\3>\3\1\2=\2\v\0016\1\3\0009\1\15\0019\1\16\1'\3\17\0'\4\18\0'\5\19\0005\6\20\0B\1\5\0016\1\3\0009\1\15\0019\1\16\1'\3\17\0'\4\21\0'\5\22\0005\6\23\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\26:NvimTreeFindFile<CR>\14<Leader>n\1\0\2\vsilent\2\fnoremap\2\24:NvimTreeToggle<CR>\14<Leader>e\6n\20nvim_set_keymap\bapi\acb\acd\1\0\1\bkey\n<C-g>\23nvim_tree_bindings\29nvim_tree_indent_markers\20nvim_tree_width\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\fasdfjkl\"nvim_tree_window_picker_chars\6g\bvim\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.tresitter\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\a\0)\1\2\0=\1\b\0006\0\0\0009\0\a\0)\0012\0=\1\t\0K\0\1\0\24undotree_SplitWidth\26undotree_WindowLayout\6g\1\0\2\vsilent\2\fnoremap\2\24:UndotreeToggle<CR>\14<leader>u\6n\20nvim_set_keymap\bapi\bvim\0" },
    keys = { { "", "<leader>u" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    commands = { "GBrowse" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/vim-rhubarb"
  },
  ["vim-signature"] = {
    after_files = { "/Users/philippe/.local/share/nvim/site/pack/packer/opt/vim-signature/after/plugin/signature.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/vim-signature"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\17:ZenMode<CR>\a;z\6n\20nvim_set_keymap\bapi\bvim\vwindow\1\0\0\1\0\1\vheight\4͙��\f̙��\3\nsetup\rzen-mode\frequire\0" },
    keys = { { "", ";z" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/philippe/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\b│\26indent_blankline_char\6g\bvim\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\a+match_only_the_start_of_same_char_seqs\2\25grey_out_search_area\2\27highlight_unique_chars\1)jump_on_partial_input_safety_timeout\3�\3\24jump_to_first_match\2\30full_inclusive_prefix_key\n<c-x>\21limit_ft_matches\3\5\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n�\6\0\0\6\0\30\0A6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\28\0'\4\26\0005\5\29\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\14<leader>5\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(4)<CR>\14<leader>4\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(3)<CR>\14<leader>3\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(2)<CR>\14<leader>2\1\0\2\vsilent\2\fnoremap\0023<Cmd>lua require(\"harpoon.ui\").nav_file(1)<CR>\14<leader>1\1\0\2\vsilent\2\fnoremap\0024<Cmd>lua require(\"harpoon.mark\").add_file()<CR>\14<leader>a\1\0\2\vsilent\2\fnoremap\2;<Cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>\14<leader>h\6n\20nvim_set_keymap\bapi\bvim\tmenu\1\0\0\1\0\2\vheight\3\b\nwidth\3P\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\vcss_fn\2\bcss\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.tresitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\4\0\0\a\0\24\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0009\1\4\1'\2\6\0=\2\5\0016\1\3\0009\1\4\1)\2\0\0=\2\a\0016\1\3\0009\1\4\1)\2\0\0=\2\b\0016\1\3\0009\1\4\1)\0027\0=\2\t\0016\1\3\0009\1\4\1)\2\1\0=\2\n\0016\1\3\0009\1\4\0014\2\3\0005\3\f\0\18\4\0\0'\6\r\0B\4\2\2=\4\14\3>\3\1\2=\2\v\0016\1\3\0009\1\15\0019\1\16\1'\3\17\0'\4\18\0'\5\19\0005\6\20\0B\1\5\0016\1\3\0009\1\15\0019\1\16\1'\3\17\0'\4\21\0'\5\22\0005\6\23\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\26:NvimTreeFindFile<CR>\14<Leader>n\1\0\2\vsilent\2\fnoremap\2\24:NvimTreeToggle<CR>\14<Leader>e\6n\20nvim_set_keymap\bapi\acb\acd\1\0\1\bkey\n<C-g>\23nvim_tree_bindings\29nvim_tree_indent_markers\20nvim_tree_width\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\fasdfjkl\"nvim_tree_window_picker_chars\6g\bvim\23nvim_tree_callback\21nvim-tree.config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\b\0\17\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\1\a\0\18\2\0\0'\4\b\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\b\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\b\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\1\18\2\0\0'\4\b\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\1K\0\1\0-<CMD>lua require('Navigator').down()<CR>\n<C-j>.<CMD>lua require('Navigator').right()<CR>\n<C-l>+<CMD>lua require('Navigator').up()<CR>\n<C-k>-<CMD>lua require('Navigator').left()<CR>\n<C-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\1\0\2\14auto_save\fcurrent\20disable_on_zoom\2\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: AutoSave.nvim
time([[Config for AutoSave.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\16\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0'\3\4\0006\4\5\0009\4\6\0049\4\a\4'\6\b\0B\4\2\2&\3\4\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\15conditions\20filetype_is_not\1\2\0\0\rfugitive\1\0\2\15modifiable\2\vexists\2\vevents\1\3\0\0\16InsertLeave\14FocusLost\22execution_message\r%H:%M:%S\rstrftime\afn\bvim\24AutoSave: saved at \1\0\4\22write_all_buffers\1\fenabled\2\20on_off_commands\2 clean_command_line_interval\3�\19\nsetup\rautosave\frequire\0", "config", "AutoSave.nvim")
time([[Config for AutoSave.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file GBrowse lua require("packer.load")({'vim-rhubarb'}, { cmd = "GBrowse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>s <cmd>lua require("packer.load")({'nvim-spectre'}, { keys = "<lt>leader>s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ;z <cmd>lua require("packer.load")({'zen-mode.nvim'}, { keys = ";z", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>u <cmd>lua require("packer.load")({'undotree'}, { keys = "<lt>leader>u", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe', 'vim-vsnip'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'indent-blankline.nvim', 'vim-signature'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

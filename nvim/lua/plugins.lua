return require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  -- common
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'

  -- git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'b3nj5m1n/kommentary'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

 -- theme
  use 'sainnhe/sonokai'
  use 'folke/tokyonight.nvim'

  use 'hoob3rt/lualine.nvim'
  use 'ggandor/lightspeed.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'

  use 'kyazdani42/nvim-tree.lua'
  use 'norcalli/nvim-colorizer.lua'
  use 'kevinhwang91/nvim-bqf'
  use 'numToStr/Navigator.nvim'

  -- snippets
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'

  --rice
  use 'lukas-reineke/indent-blankline.nvim'

  -- tools
  use 'windwp/nvim-spectre'
  use 'mbbill/undotree'
  use "akinsho/nvim-toggleterm.lua"
  use 'ThePrimeagen/harpoon'
  use 'Pocco81/AutoSave.nvim'
  use 'folke/zen-mode.nvim'
  use 'kshenoy/vim-signature'

  end)

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

local packer = require('packer')

packer.startup(function()

    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'github/copilot.vim'
    use "antoinemadec/FixCursorHold.nvim"
    use { 'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons' }
    use "tpope/vim-repeat"


    -- debugger
    --[[ use 'mfussenegger/nvim-dap'
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function ()
            require("dapui").setup()
        end} ]]

    -- lsp
    --[[ use {
        'mfussenegger/nvim-jdtls' ,
        config = function()
            require('lsp.java')
        end
    } ]]

    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('lsp/config')
            require('lsp/tsserver')
        end
    }

    use {
        'famiu/feline.nvim',
        config = function()
            require('plugins.feline')
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("plugins.treesitter")
        end
    }

    use {
        'nvim-treesitter/playground',
        cmd = {'TSHighlightCapturesUnderCursor','TSPlaygroundToggle'}
    }

    use {
        'tpope/vim-fugitive',
        event = "BufRead",
        cmd = { 'Git', 'Glog', 'Gdiffsplit', 'GBlame' },
    }

    use {
        'ruifm/gitlinker.nvim',
        keys = '<leader>gy',
        config = function()
            require"gitlinker".setup()
        end
    }

    use {
        "akinsho/toggleterm.nvim",
        keys = '<leader>g',
        config = function()
            require("plugins.toggleterm")
        end

    }
    use {
        'lewis6991/gitsigns.nvim' ,
        event = "BufRead",
        config = function()
            require("plugins.gitsigns")
        end
    }

    use {
        'tpope/vim-surround',
        event = "BufRead",
    }
    use {
        'numToStr/Comment.nvim',
        event = "BufRead",
        config = function()
            require('Comment').setup()
        end
}

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        requires = {"kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.telescope")
        end
    }

    use {
        'ggandor/lightspeed.nvim' ,
        event = "BufRead",
        config = function()
            require("plugins.lightspeed")
        end
    }


    use {
        'windwp/nvim-autopairs',
        after = "nvim-cmp",
        config = function()
            require("nvim-autopairs").setup()
        end
    }
    use {
        'windwp/nvim-ts-autotag',
        event = "BufRead",
        after ="nvim-treesitter",
        config = function()
            require("nvim-ts-autotag").setup()
        end
    }
    use {
        'kyazdani42/nvim-tree.lua' ,
        keys={ '<leader>e', '<leader>n' },
        config = function()
            require("plugins.nvimtree")
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        cmd = "ColorizerToggle",
        config = function()
            require("plugins.colorizer")
        end
    }
    use {
        'kevinhwang91/nvim-bqf',
        event = "BufRead"
    }

    use {
        'numToStr/Navigator.nvim' ,
        event = "BufRead",
        config = function()
            require("plugins.navigator")
        end
    }

    use {
        'chentau/marks.nvim',
        config = function()
            require("plugins.marks")
        end
    }

    -- tools
    use {
        'windwp/nvim-spectre',
        keys = '<leader>s',
        config = function()
            require("plugins.spectre")
        end
    }

    use {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = "<leader>u",
        config = function()
            require("plugins.undotree")
        end,
    }

    use {
        'ThePrimeagen/harpoon',
        keys = { '<leader>h','<leader>a','<leader>1', '<leader>2' ,'<leader>3' ,'<leader>4' ,'<leader>5'  },
        config = function()
            require("plugins.harpoon")
        end
    }

    use {
        'folke/zen-mode.nvim',
        keys=';z',
        config = function()
            require("plugins.zenmode")
        end
    }

    use {
        'kevinhwang91/nvim-hlslens',
        event = "BufRead",
        config = function()
            require("plugins.hlslens")
        end
    }

    use 'onsails/lspkind-nvim'
    use 'rafamadriz/friendly-snippets'

    use {
        'L3MON4D3/LuaSnip',
        after = 'nvim-cmp',
        config = function()
            require("plugins.luasnip")
        end

    }

      -- completion engine
    use {
        'hrsh7th/nvim-cmp',
        event = "BufRead",
        requires = {
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', },
            { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', },
            { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp', },
            { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp', },
            { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip', },
        },
        config = function()
            require("plugins.cmp")
        end,
    }


    use { 'tami5/lspsaga.nvim' }

    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('lsp/null-ls')
        end
    }

    use {
        "kwkarlwang/bufjump.nvim",
        config = function()
            require("bufjump").setup({})
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.indent-blankline")
        end
    }



end )


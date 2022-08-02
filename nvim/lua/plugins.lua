vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

local packer = require('packer')

packer.startup(function()

     use 'wbthomason/packer.nvim'
     use 'lewis6991/impatient.nvim'
     use 'nvim-lua/plenary.nvim'
     use {
         'antoinemadec/FixCursorHold.nvim',
         event = "BufRead",
     }
    use {
        "nanozuki/tabby.nvim",
        config = function()
            require('plugins.tabby')        
        end,
    }
    use "tpope/vim-repeat"

    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('lsp/config')
            require('lsp/server')
        end
    }

    --[[ use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('plugins.lualine')
        end
    } ]]

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("plugins.treesitter")
        end
    }

    use {
        'tpope/vim-fugitive',
        event = "BufRead",
        cmd = { 'Git', 'Glog', 'Gdiffsplit', 'GBlame' },
    }
    use {
        'tpope/vim-rhubarb'
    }
    use {
        'tpope/vim-unimpaired',
        event = "BufRead",
    }

    use {
        'lewis6991/gitsigns.nvim' ,
        config = function()
            require("plugins.gitsigns")
        end
    }

use({
    "kylechui/nvim-surround",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})

    use {
        'b3nj5m1n/kommentary',
        event = "BufRead",
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        after = "telescope-fzf-native.nvim",
        cmd = "Telescope",
        module = 'telescope',
        requires = {"kyazdani42/nvim-web-devicons", "nvim-telescope/telescope-live-grep-raw.nvim",'nvim-telescope/telescope-fzf-native.nvim', "harpoon"},
        config = function()
            require("plugins.telescope")
        end
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
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
        'chentoast/marks.nvim',
        event = "BufRead",
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

    --[[ use {
        'folke/zen-mode.nvim',
        keys=';z',
        config = function()
            require("plugins.zenmode")
        end
    } ]]

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


    use({
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        branch = "main",
        config = function()
            require("plugins.saga")
        end,
    })

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
        event = "BufRead",
        config = function()
            require("plugins.indent-blankline")
        end
    }

    use {
        'kdheepak/lazygit.nvim',
        event = "VimEnter",
    }

    use {
        'rhysd/clever-f.vim',
        event = "BufRead",
        config = function()
            vim.g.clever_f_across_no_line = 1;
            vim.g.clever_f_mark_char_color = 'LeapMatch';
        end
    }

    use { 'ggandor/leap.nvim', event = "BufRead" , config = function() require("plugins.leap") end }
    use { 'EdenEast/nightfox.nvim' }
    use { 'j-hui/fidget.nvim', config = function() require"fidget".setup{
        sources = {
            ["null-ls"] = {
                ignore = true,
            },
  },
    } end }
    use({
        'mvllow/modes.nvim',
        config = function()
            require('modes').setup()
        end
    })
    use {
        'jose-elias-alvarez/typescript.nvim',
    }
    use {'folke/trouble.nvim'}
    --[[ use {
        'anuvyklack/hydra.nvim',
        config = function()
            require('plugins.hydras.window')
        end
    }  ]]
    -- use {'Pocco81/auto-save.nvim'}
    use {
        'mrjones2014/smart-splits.nvim',
        config = function()
            require('smart-splits').setup({});
        end
    }
    use {
        'sindrets/winshift.nvim',
        config = function()
            require("winshift").setup({
                -- {other options...}

                ---A function that should prompt the user to select a window.
                ---
                ---The window picker is used to select a window while swapping windows with
                ---`:WinShift swap`.
                ---@return integer? winid # Either the selected window ID, or `nil` to
                ---   indicate that the user cancelled / gave an invalid selection.
                window_picker = function()
                    return require("winshift.lib").pick_window({
                        -- A string of chars used as identifiers by the window picker.
                        picker_chars = "BCD",
                        filter_rules = {
                            -- This table allows you to indicate to the window picker that a window
                            -- should be ignored if its buffer matches any of the following criteria.
                            cur_win = true, -- Filter out the current window
                            floats = true,  -- Filter out floating windows
                            filetype = {},  -- List of ignored file types
                            buftype = {},   -- List of ignored buftypes
                            bufname = {},   -- List of vim regex patterns matching ignored buffer names
                        },
                        ---A function used to filter the list of selectable windows.
                        ---@param winids integer[] # The list of selectable window IDs.
                        ---@return integer[] filtered # The filtered list of window IDs.
                        filter_func = nil,
                    })
                end,
            })
        end
    }


end )



vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()

    use { 'wbthomason/packer.nvim' }
    use 'lewis6991/impatient.nvim'

    -- common
    use 'nvim-lua/popup.nvim'
    use { "nvim-lua/plenary.nvim" }

    -- debugger
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function ()
            require("dapui").setup()
        end}

    -- lsp
    use {
        'mfussenegger/nvim-jdtls' ,
        config = function()
            require('lsp.java')
        end
    }

    use{
        'neovim/nvim-lspconfig',
        config = function()
            require('lsp/config')
            require('lsp/efm')
            require('lsp/tsserver')
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("plugins.treesitter")
        end
    }

    use {'nvim-treesitter/playground',
        cmd = {'TSHighlightCapturesUnderCursor','TSPlaygroundToggle'}
    }

    -- use 'ray-x/lsp_signature.nvim'

    -- git
    use {  'tpope/vim-fugitive',
        event = "BufRead",
        cmd ={ 'Git', 'Glog', 'Gdiffsplit', 'GBlame' },
            config = function()
            local fn, cmd = vim.fn, vim.cmd
                function my_statusline()
                        local branch = fn.FugitiveHead()

                        if branch and #branch > 0 then
                            branch = '  '..branch ..' |'
                        end

                        return branch..'    %f  %m%r%h%w%=[%l,%v]      [%L,%p%%] %n'
                end

cmd[[ set statusline=%!luaeval('my_statusline()') ]]
            end
    }
    use {'ruifm/gitlinker.nvim',
        keys = '<leader>gy',
        config = function()
            require"gitlinker".setup()
        end
    }

    use {  "akinsho/toggleterm.nvim",
        keys = '<leader>g',
        config = function()
            local Terminal  = require('toggleterm.terminal').Terminal
            local lazygit = Terminal:new({
                cmd = "lazygit",
                dir = "git_dir",
                direction = "float",
                float_opts = {
                    border = "double",
                },
                -- function to run on opening the terminal
                on_open = function(term)
                    vim.cmd("startinsert!")
                    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
                end,
                -- function to run on closing the terminal
                on_close = function(term)
                    vim.cmd("Closing terminal")
                end,
            })

            function _lazygit_toggle()
                lazygit:toggle()
            end

            vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
        end

    }
    use {
        'lewis6991/gitsigns.nvim' ,
        event = "BufRead",
        config = function()
            require("plugins.gitsigns")
        end
    }

    use {'tpope/vim-surround',
        event = "BufRead",
    }
    use {'b3nj5m1n/kommentary',
        event = "BufRead",
    }
    use{  'sindrets/winshift.nvim',
        event = 'BufRead',
        config = function()
            require("winshift").setup({
                highlight_moving_win = true,  -- Highlight the window being moved
                focused_hl_group = "BlueVisual",  -- The highlight group used for the moving window
                moving_win_options = {
                    -- These are local options applied to the moving window while it's
                    -- being moved. They are unset when you leave Win-Move mode.
                    wrap = false,
                    cursorline = false,
                    cursorcolumn = false,
                    colorcolumn = "",
                }
            })
            vim.api.nvim_set_keymap('n', '<C-W>m', ':WinShift<CR>', {noremap = true, silent = true})
        end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        requires = {"kyazdani42/nvim-web-devicons", "nvim-telescope/telescope-project.nvim" },
        config = function()
            require("plugins.telescope")
        end
    }

    use { 'ggandor/lightspeed.nvim' ,
        event = "BufRead",
        config = function()
            require'lightspeed'.setup {
                jump_to_first_match = true,
                jump_on_partial_input_safety_timeout = 400,
                highlight_unique_chars = false,
                grey_out_search_area = true,
                match_only_the_start_of_same_char_seqs = true,
                limit_ft_matches = 5,
                full_inclusive_prefix_key = '<c-x>',
            }
        end
    }


    use {
        'windwp/nvim-autopairs',
        after = "nvim-cmp",
        config = function()
            require('nvim-autopairs').setup()
        end
    }
    use {  'windwp/nvim-ts-autotag',
        event = "BufRead",
        after ="nvim-treesitter",
        config = function()
            require('nvim-ts-autotag').setup()
        end
    }
    use{  'kyazdani42/nvim-tree.lua' ,
        keys='<leader>e',
        config = function()
            local tree_cb = require'nvim-tree.config'.nvim_tree_callback

            vim.g.nvim_tree_git_hl = 0
            vim.g.nvim_tree_gitignore = 0
            vim.g.nvim_tree_show_icons = {
                git = 0,
                folders = 1,
                files = 1,
            }
            vim.g.nvim_tree_window_picker_chars ='asdfjkl'
            vim.g.nvim_tree_width = 55
            vim.g.nvim_tree_indent_markers = 1

            vim.g.nvim_tree_bindings = {
                { key = "<C-g>",    cb = tree_cb("cd") },
            }

            vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})


        end
    }

    use { 'norcalli/nvim-colorizer.lua',
        cmd = "ColorizerToggle",
        config = function()
            require'colorizer'.setup(
                {'*';},
                {
                    RGB      = true;         -- #RGB hex codes --blue
                    RRGGBB   = true;         -- #RRGGBB hex codes
                    RRGGBBAA = true;         -- #RRGGBBAA hex codes
                    rgb_fn   = true;         -- CSS rgb() and rgba() functions
                    hsl_fn   = true;         -- CSS hsl() and hsla() functions
                    css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
                })
        end
    }
    use{ 'kevinhwang91/nvim-bqf',
        event = "BufRead" }

    use { 'numToStr/Navigator.nvim' ,
        event = "BufRead",
        config = function()
            require('Navigator').setup({
                auto_save = 'current',
                disable_on_zoom = true
            })
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }

            map('n', "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
            map('n', "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
            map('n', "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
            map('n', "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
        end
    }


    use {
        'kshenoy/vim-signature',
        event = "BufRead",
    }

    -- tools
    use{ 'windwp/nvim-spectre',
        keys = '<leader>s',
        config = function()
            require('spectre').setup()
            vim.api.nvim_set_keymap('n', '<Leader>s',  [[<Cmd>lua require('spectre').open()<CR>]], { noremap = true, silent = true })
        end
    }

    use {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = "<leader>u",
        config = function()
            vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<CR>",  {silent = true, noremap = true})
            vim.g.undotree_WindowLayout = 2
            vim.g.undotree_SplitWidth = 50
        end,
    }

    use {'ThePrimeagen/harpoon',
        keys = { '<leader>h','<leader>a','<leader>1', '<leader>2' ,'<leader>3' ,'<leader>4' ,'<leader>5'  },
        config = function()
            require('harpoon').setup {
                menu = {
                    width = 80,
                    height = 8,
                }
            }
            vim.api.nvim_set_keymap('n', '<leader>h',  [[<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>a',  [[<Cmd>lua require("harpoon.mark").add_file()<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>1',  [[<Cmd>lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>2',  [[<Cmd>lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>3',  [[<Cmd>lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>4',  [[<Cmd>lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>5',  [[<Cmd>lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true, silent = true })
        end
    }

    use {'folke/zen-mode.nvim',
        keys=';z',
        config = function()
            require("zen-mode").setup {
                window = {
                    height = 0.9
                }
            }
            vim.api.nvim_set_keymap('n', ';z', ':ZenMode<CR>', {noremap = true, silent = true})
        end
    }

    use {'kevinhwang91/nvim-hlslens',
        event = "BufRead",
        config = function()
            require('hlslens').setup({
                calm_down = true,
                nearest_only = true,
                nearest_float_when = 'always'
            })
        end
    }

    use { 'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons' }

    use 'onsails/lspkind-nvim'
    use "rafamadriz/friendly-snippets"
    use { 'L3MON4D3/LuaSnip',
        after = 'nvim-cmp',
        config = function()
            local present, luasnip = pcall(require, "luasnip")
            if not present then
                return
            end

            luasnip.config.set_config(
                {
                    history = true,
                    updateevents = "TextChanged,TextChangedI"
                }
            )
            require("luasnip/loaders/from_vscode").load()
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
            { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip', },
        },
        config = function()
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
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'nvim_lsp' },
                },
                documentation = {
                    border = 'single'
                }
            })
        end,
    }
end)


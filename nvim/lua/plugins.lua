vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

local packer = require("packer")

packer.startup(function()
	use("wbthomason/packer.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("lewis6991/impatient.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nanozuki/tabby.nvim",
		event = "BufRead",
		config = function()
			require("plugins.tabby")
		end,
	})
	use("tpope/vim-repeat")

	use("hrsh7th/cmp-nvim-lsp")
	use("jose-elias-alvarez/typescript.nvim")
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp/config")
			require("lsp/server")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("plugins.lualine")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	})
	use({
		"nvim-treesitter/playground",
		cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
	})

	use({
		"tpope/vim-fugitive",
		event = "BufRead",
		cmd = { "Git", "Glog", "Gdiffsplit", "GBlame" },
	})
	use({
		"tpope/vim-rhubarb",
		event = "BufRead",
	})
	use({
		"tpope/vim-unimpaired",
		event = "BufRead",
	})

	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		branch = "main",
		config = function()
			require("plugins.gitsigns")
		end,
	})

	use("tpope/vim-surround")

	use({
		"b3nj5m1n/kommentary",
		event = "BufRead",
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		after = "telescope-fzf-native.nvim",
		cmd = "Telescope",
		module = "telescope",
		requires = { "kyazdani42/nvim-web-devicons", "nvim-telescope/telescope-fzf-native.nvim", "harpoon" },
		config = function()
			require("plugins.telescope")
		end,
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})
	use({
		"windwp/nvim-ts-autotag",
		event = "BufRead",
		after = "nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		keys = { "<leader>e", "<leader>n" },
		config = function()
			require("plugins.nvimtree")
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("plugins.colorizer")
		end,
	})
	use({
		"kevinhwang91/nvim-bqf",
		event = "BufRead",
	})

	use({
		"numToStr/Navigator.nvim",
		event = "BufRead",
		config = function()
			require("plugins.navigator")
		end,
	})

	use({
		"chentoast/marks.nvim",
		event = "BufRead",
		config = function()
			require("plugins.marks")
		end,
	})

	-- tools
	use({
		"windwp/nvim-spectre",
		keys = "<leader>s",
		config = function()
			require("plugins.spectre")
		end,
	})

	use({
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = "<leader>u",
		config = function()
			require("plugins.undotree")
		end,
	})

	use({
		"ThePrimeagen/harpoon",
		keys = { "<leader>h", "<leader>a", "<leader>1", "<leader>2", "<leader>3", "<leader>4", "<leader>5" },
		config = function()
			require("plugins.harpoon")
		end,
	})

	use({
		"kevinhwang91/nvim-hlslens",
		event = "BufRead",
		config = function()
			require("plugins.hlslens")
		end,
	})

	use("onsails/lspkind-nvim")
	use("rafamadriz/friendly-snippets")

	use({
		"L3MON4D3/LuaSnip",
		after = "nvim-cmp",
		config = function()
			require("plugins.luasnip")
		end,
	})

	-- completion engine
	use({
		"hrsh7th/nvim-cmp",
		after = "nvim-autopairs",
		event = "BufRead",
		requires = {
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
		},
		config = function()
			require("plugins.cmp")
		end,
	})

	use({
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		branch = "main",
		config = function()
			require("plugins.saga")
		end,
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("lsp/null-ls")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("plugins.indent-blankline")
		end,
	})

	use({
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
	})

	use({
		"ggandor/leap.nvim",
		event = "BufRead",
		config = function()
			require("plugins.leap")
		end,
	})
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				sources = {
					["null-ls"] = {
						ignore = true,
					},
				},
			})
		end,
	})

	use({
		"MunifTanjim/prettier.nvim",
		config = function()
			require("prettier").setup({
				bin = "prettierd",
			})
		end,
	})
	use({
		"folke/trouble.nvim",
		cmd = "Trouble",
	})
	use({
		"sainnhe/gruvbox-material",
		config = function()
			require("plugins.gruvbox")
		end,
	})

	use({
		"ggandor/flit.nvim",
		after = "leap.nvim",
		config = function()
			require("flit").setup({
				multiline = false,
			})
		end,
	})

	use({
		"folke/zen-mode.nvim",
		keys = { ";z" },
		config = function()
			require("plugins.zenmode")
		end,
	})
	use("andymass/vim-matchup")
end)

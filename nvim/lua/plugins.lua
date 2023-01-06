vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	"kyazdani42/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	{ "github/copilot.vim", event = "VeryLazy" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	"hrsh7th/cmp-nvim-lsp",
	{ "jose-elias-alvarez/typescript.nvim", event = "VeryLazy" },
	{ "onsails/lspkind-nvim", event = "VeryLazy" },
	{ "rafamadriz/friendly-snippets", event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{
		"nanozuki/tabby.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.tabby")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp/config")
			require("lsp/server")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugins.lualine")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{
		"nvim-treesitter/playground",
		cmd = { "TSHighlightCapturesUnderCursor", "TSPlaygroundToggle" },
	},

	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Glog", "Gdiffsplit", "GBlame" },
		dependencies = { "tpope/vim-rhubarb" },
	},
	{
		"tpope/vim-unimpaired",
		event = "VeryLazy",
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		branch = "main",
		config = function()
			require("plugins.gitsigns")
		end,
	},
	{
		"b3nj5m1n/kommentary",
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = "telescope",
		config = function()
			require("plugins.telescope")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		keys = { "<leader>e", "<leader>n" },
		config = function()
			require("plugins.nvimtree")
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require("plugins.colorizer")
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		event = "VeryLazy",
	},

	{
		"numToStr/Navigator.nvim",
		config = function()
			require("plugins.navigator")
		end,
	},
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.marks")
		end,
	},
	{
		"windwp/nvim-spectre",
		keys = "<leader>s",
		config = function()
			require("plugins.spectre")
		end,
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = "<leader>u",
		config = function()
			require("plugins.undotree")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		keys = { "<leader>h", "<leader>a", "<leader>1", "<leader>2", "<leader>3", "<leader>4", "<leader>5" },
		config = function()
			require("plugins.harpoon")
		end,
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = function()
			require("plugins.hlslens")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		config = function()
			require("plugins.luasnip")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("plugins.cmp")
		end,
	},

	{
		"glepnir/lspsaga.nvim",
		event = "VeryLazy",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		branch = "main",
		config = function()
			require("plugins.saga")
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		config = function()
			require("lsp/null-ls")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.indent-blankline")
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
	},

	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.leap")
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = function()
			require("fidget").setup({
				sources = {
					["null-ls"] = {
						ignore = true,
					},
				},
			})
		end,
	},

	{
		"MunifTanjim/prettier.nvim",
		event = "VeryLazy",
		config = function()
			require("prettier").setup({
				bin = "prettierd",
			})
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			require("plugins.gruvbox")
		end,
	},

	{
		"ggandor/flit.nvim",
		event = "VeryLazy",
		config = function()
			require("flit").setup({
				multiline = false,
			})
		end,
	},
	{
		"folke/zen-mode.nvim",
		keys = { ";z" },
		config = function()
			require("plugins.zenmode")
		end,
	},
})

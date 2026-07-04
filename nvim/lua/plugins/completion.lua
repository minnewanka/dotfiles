return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		event = "VeryLazy",
		config = function()
			require("luasnip").setup({
				region_check_events = "CursorHold,InsertLeave",
				delete_check_events = "TextChanged,InsertEnter",
			})

			-- Load friendly-snippets first
			require("luasnip/loaders/from_vscode").load()
			-- Then load custom snippets (will override duplicates)
			require("luasnip/loaders/from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
			require("luasnip").filetype_extend("typescript", { "javascript" })
			require("luasnip").filetype_extend("typescriptreact", { "javascript" })

			vim.keymap.set(
				"i",
				"<TAB>",
				"luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump':'<Tab>'",
				{ expr = true, silent = true, desc = "Luasnip expand or jump" }
			)
			vim.keymap.set("i", "<S-TAB>", function()
				require("luasnip").jump(-1)
			end, { silent = true, desc = "Luasnip jump back" })
		end,
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source

		-- use a release tag to download pre-built binaries
		version = "*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-e: Hide menu
			-- C-k: Toggle signature help
			--
			-- See the full "keymap" documentation for information on defining your own keymap.
			keymap = { preset = "enter", ["<C-D>"] = { "show", "show_documentation", "hide_documentation" } },
			cmdline = {
				keymap = {
					preset = "cmdline",
					["<Up>"] = { "select_prev", "fallback" },
					["<Down>"] = { "select_next", "fallback" },
					["<C-k>"] = { "select_prev", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
				},
			},

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			snippets = {
				preset = "luasnip",
			},

			completion = {
				menu = { border = "single" },
				documentation = { window = { border = "single" } },
			},
			signature = { enabled = true, window = { border = "single", show_documentation = true } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
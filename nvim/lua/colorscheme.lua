-- Blend two 24-bit colors, `t` of the way from `a` to `b`.
local function blend(a, b, t)
	local out = 0
	for _, shift in ipairs({ 16, 8, 0 }) do
		local ca = math.floor(a / 2 ^ shift) % 256
		local cb = math.floor(b / 2 ^ shift) % 256
		out = out + math.floor(ca + (cb - ca) * t + 0.5) * 2 ^ shift
	end
	return out
end

-- Insert mode gets a slightly contrastier cursorline. The two colors used to be
-- hardcoded hex, which happened to match alabaster dark but silently became
-- wrong for any other colorscheme (or alabaster light). Derive them instead:
-- nudging the theme's own CursorLine toward its Normal foreground lightens on a
-- dark background and darkens on a light one, so this follows any theme.
local cursorline_normal, cursorline_insert

local function recompute_cursorline()
	local cl = vim.api.nvim_get_hl(0, { name = "CursorLine", link = false })
	local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
	if not (cl.bg and normal.fg) then
		cursorline_normal, cursorline_insert = nil, nil
		return
	end
	cursorline_normal = cl.bg
	cursorline_insert = blend(cl.bg, normal.fg, 0.09)
end

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		if cursorline_insert then
			vim.api.nvim_set_hl(0, "CursorLine", { bg = cursorline_insert })
		end
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		if cursorline_normal then
			vim.api.nvim_set_hl(0, "CursorLine", { bg = cursorline_normal })
		end
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "YankHighlight", { link = "Search" })
		recompute_cursorline()

		-- Extend Alabaster's LSP semantic-token theming for TS/JS/React.
		-- Alabaster's model: color definitions (blue) + named constants (purple), leave usages plain.
		local def_fg = "#71ade7" -- Alabaster's definition blue
		local const_fg = "#cc8bc9" -- Alabaster's constant purple
		-- Definitions -> blue
		vim.api.nvim_set_hl(0, "@lsp.typemod.interface.declaration", { fg = def_fg }) -- interface Foo (gap in Alabaster's set)
		-- Named constants -> purple
		vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = const_fg })
		vim.api.nvim_set_hl(0, "@lsp.typemod.enumMember.defaultLibrary", { fg = const_fg })
		-- vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#e2cca9", bg = "NONE" })
		-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#928374", bg = "NONE" })
		-- vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { link = "Red" })
		-- -- vim.api.nvim_set_hl(0, "TSProperty", { link = "Green" })
		-- vim.api.nvim_set_hl(0, "TSConstructor", { link = "Yellow" })
		-- vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#777777" })
		-- -- vim.api.nvim_set_hl(0, "CurrentWord", { bg = "#32302f", bold = true })
		-- vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = "NONE" })
		-- vim.api.nvim_set_hl(0, "DiagnosticError", { link = "Red" })
		-- vim.api.nvim_set_hl(0, "DiagnosticHint", { link = "Green" })
		-- vim.api.nvim_set_hl(0, "DiagnosticWarn", { link = "Yellow" })
		-- vim.api.nvim_set_hl(0, "WinBar", { link = "Yellow" })
		-- -- vim.api.nvim_set_hl(0, "FlashMatch", { link = "Comment" })
		-- -- vim.api.nvim_set_hl(0, "FlashCurrent", { link = "Red" })
		-- -- vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ccff88", bg = "NONE" })
		-- vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#2e3b3b" })
		-- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = "#2e3b3b" })
	end,
})

vim.o.background = "dark"
vim.cmd("colorscheme alabaster")

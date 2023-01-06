require("luasnip").setup({
	region_check_events = "CursorHold,InsertLeave",
	delete_check_events = "TextChanged,InsertEnter",
})

require("luasnip/loaders/from_vscode").load()
require("luasnip").filetype_extend("typescript", { "javascript" })
require("luasnip").filetype_extend("typescriptreact", { "javascript" })

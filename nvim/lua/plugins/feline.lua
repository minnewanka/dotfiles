local theme = {
	fg = "#E2CBA7",
	bg = "#3b4439",
}
local components = {
	active = {},
	inactive = {},
}
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

table.insert(components.inactive, {})

components.active[1][1] = {
	provider = {
		name = "file_info",
		opts = {
			type = "relative",
		},
	},
	left_sep = " ",
	right_sep = " ",
}
components.active[1][2] = {
	provider = "git_branch",
	left_sep = " ",
	right_sep = " ",
}

components.active[3][1] = {
	provider = "git_diff_added",
	left_sep = " ",
	hl = {
		fg = "#B1B946",
	},
}
components.active[3][2] = {
	provider = "git_diff_changed",
	hl = {
		fg = "#7EA99D",
	},
}
components.active[3][3] = {
	provider = "git_diff_removed",
	right_sep = " ",
	hl = {
		fg = "#F2584A",
	},
}
components.active[3][4] = {
	provider = "position",
	left_sep = " ",
	right_sep = " ",
}
components.active[3][5] = {
	provider = "line_percentage",
	left_sep = " ",
	right_sep = " ",
}

components.inactive[1][1] = {
	provider = {
		name = "file_info",
		opts = {
			type = "relative",
		},
	},
	provider = "file_info",
	hl = {
		fg = "#A89985",
		bg = "#3a3735",
	},
	left_sep = " ",
}

require("feline").setup({ theme = theme, components = components })

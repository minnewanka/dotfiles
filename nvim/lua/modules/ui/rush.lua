-- Jump to the root of a Rush monorepo module (app/lib), sourced straight from
-- rush.json's "projects" list — the same inventory `rush build --to <pkg>`
-- uses. This is more reliable than Snacks' git-root project picker (a Rush
-- repo has a single top-level .git) or a directory glob (some libs, e.g.
-- libs/voyagers/packages/*, are nested deeper than a shallow scan would find).
local M = {}

--- Parse rush.json's projects list into { text, file } picker items.
---@return table[]
function M.projects()
	local rush_json = vim.fs.find("rush.json", { upward = true, path = vim.fn.getcwd() })[1]
	if not rush_json then
		return {}
	end
	local base = vim.fs.dirname(rush_json)

	local items, pkg = {}, nil
	for line in io.lines(rush_json) do
		if not line:match("^%s*//") then -- skip the commented-out template entry
			local name = line:match('"packageName"%s*:%s*"([^"]+)"')
			local folder = line:match('"projectFolder"%s*:%s*"([^"]+)"')
			if name then
				pkg = name
			end
			if folder then
				items[#items + 1] = {
					text = string.format("%-30s %s", pkg or "?", folder),
					file = base .. "/" .. folder,
				}
				pkg = nil
			end
		end
	end
	return items
end

--- Open a Snacks picker over Rush modules.
--- <CR>  tcd's into the module and reopens the file picker rooted there.
--- `     just tcd's into the module and closes the picker.
function M.pick()
	local cd_only = function(picker, item)
		if not item then
			return
		end
		picker:close()
		vim.cmd.tcd(item.file)
	end

	Snacks.picker.pick({
		source = "rush_modules",
		items = M.projects(),
		format = "text",
		confirm = function(picker, item)
			picker:close()
			vim.cmd.tcd(item.file)
			Snacks.picker.files({ cwd = item.file })
		end,
		actions = {
			cd_only = cd_only,
		},
		win = {
			input = { keys = { ["`"] = { "cd_only", mode = { "n", "i" } } } },
			list = { keys = { ["`"] = "cd_only" } },
		},
	})
end

return M

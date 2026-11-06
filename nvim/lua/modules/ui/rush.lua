-- Jump to the root of a Rush monorepo module (app/lib), sourced straight from
-- rush.json's "projects" list — the same inventory `rush build --to <pkg>`
-- uses. This is more reliable than Snacks' git-root project picker (a Rush
-- repo has a single top-level .git) or a directory glob (some libs, e.g.
-- libs/voyagers/packages/*, are nested deeper than a shallow scan would find).
local M = {}

--- Read the "name" field out of a package.json, if present.
---@param dir string
---@return string?
local function package_name(dir)
	local path = dir .. "/package.json"
	if vim.fn.filereadable(path) == 0 then
		return nil
	end
	for line in io.lines(path) do
		local name = line:match('"name"%s*:%s*"([^"]+)"')
		if name then
			return name
		end
	end
	return nil
end

--- Find app/lib folders that have a package.json but aren't listed in
--- rush.json yet — projects that exist in the monorepo but aren't wired up.
---@param base string
---@param wired table<string, boolean> projectFolder -> true, from rush.json
---@return string[] folders, relative to base, sorted
local function unwired_projects(base, wired)
	local candidates = {}
	for _, pat in ipairs({ "/apps/*", "/libs/*", "/libs/*/packages/*" }) do
		vim.list_extend(candidates, vim.fn.glob(base .. pat, false, true))
	end

	local folders = {}
	for _, dir in ipairs(candidates) do
		local folder = dir:sub(#base + 2)
		if not wired[folder] and vim.fn.filereadable(dir .. "/package.json") == 1 then
			folders[#folders + 1] = folder
		end
	end
	table.sort(folders)
	return folders
end

--- Parse rush.json's projects list into { text, file } picker items, plus
--- any apps/libs folders that have a package.json but aren't wired to rush
--- yet (tagged "[unwired]" so they're easy to spot/skip).
---@return table[]
function M.projects()
	local rush_json = vim.fs.find("rush.json", { upward = true, path = vim.fn.getcwd() })[1]
	if not rush_json then
		return {}
	end
	local base = vim.fs.dirname(rush_json)

	local items, pkg, wired = {}, nil, {}
	for line in io.lines(rush_json) do
		if not line:match("^%s*//") then -- skip the commented-out template entry
			local name = line:match('"packageName"%s*:%s*"([^"]+)"')
			local folder = line:match('"projectFolder"%s*:%s*"([^"]+)"')
			if name then
				pkg = name
			end
			if folder then
				items[#items + 1] = {
					text = string.format("%-30s %-10s %s", pkg or "?", "", folder),
					file = base .. "/" .. folder,
				}
				wired[folder] = true
				pkg = nil
			end
		end
	end

	for _, folder in ipairs(unwired_projects(base, wired)) do
		local name = package_name(base .. "/" .. folder) or vim.fs.basename(folder)
		items[#items + 1] = {
			text = string.format("%-30s %-10s %s", name, "[unwired]", folder),
			file = base .. "/" .. folder,
		}
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

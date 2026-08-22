-- claude_route.lua
--
-- Route a neovim selection / file reference to the standalone Claude instance
-- (running in a tmux session) whose working directory matches the current
-- buffer's project.
--
-- Why this exists: coder/claudecode.nvim uses a reversed connection model --
-- Claude connects INTO neovim's websocket server and `ClaudeCodeSend`
-- *broadcasts* to every connected client. That can't target "the Claude for
-- this project" among many. Here we instead pick exactly one tmux pane by
-- path and paste to it, so each project's Claude gets only its own buffers.
--
-- Matching is by git repository root: a pane belongs to the current buffer
-- when `git rev-parse --show-toplevel` is the same for the pane's cwd and the
-- file's directory. This survives the Claude `cd`-ing into a subdirectory.
-- Falls back to longest path-prefix for non-git projects.

local M = {}

-- tmux session holding the standalone Claude instances.
M.session = "agent"

-- If true, press Enter after pasting so the message submits immediately.
-- Off by default: the text lands in the prompt so you can add context first,
-- matching the IDE at-mention behaviour.
M.auto_submit = false

local function tmux(args, stdin)
	local cmd = { "tmux" }
	vim.list_extend(cmd, args)
	local out = vim.fn.system(cmd, stdin)
	if vim.v.shell_error ~= 0 then
		return nil, out
	end
	return out
end

local function realpath(p)
	return (p and vim.loop.fs_realpath(p)) or p
end

local gitroot_cache = {}
local function gitroot(dir)
	if not dir then
		return nil
	end
	if gitroot_cache[dir] == nil then
		local out = vim.fn.system({ "git", "-C", dir, "rev-parse", "--show-toplevel" })
		gitroot_cache[dir] = (vim.v.shell_error == 0) and (out:gsub("%s+$", "")) or false
	end
	return gitroot_cache[dir] or nil
end

-- Find the Claude pane for `file`, matching by git root (with a path-prefix
-- fallback). Returns the pane info plus the file's git root, or nil.
-- Prefers the configured session; falls back to the whole tmux server.
local function find_pane(file)
	file = realpath(file)
	local froot = gitroot(vim.fn.fnamemodify(file, ":h"))
	local fmt = "#{pane_id}\t#{pane_current_path}\t#{pane_current_command}"
	local out = tmux({ "list-panes", "-s", "-t", M.session, "-F", fmt })
	if not out or out == "" then
		out = tmux({ "list-panes", "-a", "-F", fmt })
	end
	if not out then
		return nil, froot
	end

	local best, best_score = nil, -1
	for line in out:gmatch("[^\n]+") do
		local pane, path, cmd = line:match("^(%S+)\t([^\t]+)\t(.*)$")
		if pane and path then
			local p = realpath(path):gsub("/$", "")
			-- a version-like command (Claude renaming its own process,
			-- e.g. "2.1.205") breaks ties toward the actual Claude pane.
			local claudeish = cmd:match("^%d+%.%d") and 1 or 0
			local score
			if froot and gitroot(p) == froot then
				score = 1000 + claudeish -- git-root match: strongest signal
			elseif file == p or file:sub(1, #p + 1) == p .. "/" then
				score = #p * 2 + claudeish -- prefix fallback (non-git dirs)
			end
			if score and score > best_score then
				best, best_score = { pane = pane, path = p, cmd = cmd }, score
			end
		end
	end
	return best, froot
end

-- Paste text into a pane via a named tmux buffer using bracketed paste,
-- so multiline content arrives as a single prompt entry.
local function paste(pane, text)
	local buf = "cc_route"
	tmux({ "load-buffer", "-b", buf, "-" }, text)
	tmux({ "paste-buffer", "-p", "-d", "-b", buf, "-t", pane })
	if M.auto_submit then
		tmux({ "send-keys", "-t", pane, "Enter" })
	end
end

-- Path relative to the git root, for a readable label. Absolute paths are
-- used for the actual @-reference so they resolve wherever Claude's cwd is.
local function rel_to_root(file, root)
	file = realpath(file)
	if root and file:sub(1, #root + 1) == root .. "/" then
		return file:sub(#root + 2)
	end
	return vim.fn.fnamemodify(file, ":t")
end

-- <leader>cb : send an @file reference for the current buffer.
function M.add_file()
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" then
		return vim.notify("claude-route: buffer has no file", vim.log.levels.WARN)
	end
	local t, froot = find_pane(file)
	if not t then
		return vim.notify("claude-route: no Claude pane for\n" .. file, vim.log.levels.WARN)
	end
	-- absolute path: unambiguous regardless of the Claude's current cwd.
	paste(t.pane, "@" .. realpath(file) .. " ")
	vim.notify("claude-route → " .. t.pane .. "  " .. rel_to_root(file, froot))
end

-- <leader>cs (visual) : send the selected lines as a fenced block.
function M.send_selection()
	local file = vim.api.nvim_buf_get_name(0)
	local t, froot = find_pane(file)
	if not t then
		return vim.notify("claude-route: no Claude pane for\n" .. file, vim.log.levels.WARN)
	end
	local sl = vim.fn.getpos("'<")[2]
	local el = vim.fn.getpos("'>")[2]
	if sl == 0 or el == 0 then
		return vim.notify("claude-route: no selection", vim.log.levels.WARN)
	end
	local lines = vim.api.nvim_buf_get_lines(0, sl - 1, el, false)
	local header = string.format("%s:%d-%d", rel_to_root(file, froot), sl, el)
	local payload = table.concat({
		header,
		"```" .. (vim.bo.filetype or ""),
		table.concat(lines, "\n"),
		"```",
		"",
	}, "\n")
	paste(t.pane, payload)
	vim.notify("claude-route → " .. t.pane .. "  " .. header)
end

return M


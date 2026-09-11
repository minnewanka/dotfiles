# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim configuration repository using Lua with lazy.nvim plugin manager. The configuration emphasizes modularity, performance, and AI-assisted development.

## Architecture

The configuration follows a modular structure:
- `init.lua` - Entry point that loads all modules
- `lua/plugins/` - Plugin definitions, one file per domain (ai, colorscheme, completion, editing, git, lsp, treesitter, ui)
- `lua/settings.lua` - Core Neovim settings
- `lua/keybinding.lua` - Key mappings (leader: space, localleader: semicolon)
- `lua/lsp/` - LSP configuration split into config.lua (diagnostics) and server.lua (servers)
- `after/ftplugin/` - Filetype-specific settings; `java.lua` holds the whole jdtls setup
- `lazy-lock.json` - Locked plugin versions for reproducibility

## Key Development Patterns

When modifying this configuration:
1. Plugin additions go in the matching `lua/plugins/*.lua` file with appropriate lazy-loading events
2. LSP server configurations belong in `lua/lsp/server.lua` (except jdtls, see below)
3. Keybindings should be added to `lua/keybinding.lua` or in plugin specs
4. Use lazy.nvim's spec format for plugin configuration
5. Maintain performance by using lazy-loading events (VeryLazy, BufReadPre, etc.)

## Plugin Management

Uses lazy.nvim with optimized loading:
- Install/update plugins: `:Lazy` command opens UI
- Plugin specs in `lua/plugins/*.lua` use return table format
- Version locking via `lazy-lock.json` - commit this file for reproducibility

## LSP Configuration

LSP servers are configured in `lua/lsp/server.lua` using Neovim 0.11+'s native `vim.lsp.config()` / `vim.lsp.enable()` APIs:
- TypeScript: vtsls (@vtsls/language-server)
- Python: basedpyright
- Web: html, cssls, jsonls, eslint
- Other: marksman, zls, clangd
- Completion capabilities come from blink.cmp, applied once via `vim.lsp.config("*", ...)` at the top of `server.lua` (blink does not wire this up itself)

Every server needs BOTH a `vim.lsp.enable("<name>")` call and (optionally) a
`vim.lsp.config("<name>", {...})` block. A config block on its own does nothing.

LSP server binaries are installed manually (via Homebrew / npm), not via mason. When adding a new server:
1. Install the binary externally
2. Add `vim.lsp.config("<name>", {...})` (if customizing) and `vim.lsp.enable("<name>")` to `lua/lsp/server.lua`

## Java / jdtls

Java is the exception: jdtls is started by nvim-jdtls from `after/ftplugin/java.lua`,
not through `vim.lsp.enable`. nvim-jdtls provides `jdt://` decompiled-source
navigation and the extended jdtls protocol, neither of which a plain
`vim.lsp.enable` client gets.

Root resolution is two-tier, both via `vim.fs.root`:
1. Multi-module markers first (`mvnw`, `gradlew`, `settings.gradle`,
   `settings.gradle.kts`, `.git`), so a submodule pom does not split one project
   into several roots.
2. Falling back to per-project markers (`pom.xml`, `build.gradle`,
   `build.gradle.kts`).

The Eclipse workspace is derived from that root: `stdpath("cache")/jdtls/workspace/<root basename>`.

Notes:
- Lombok is loaded as a javaagent from `~/.local/share/java/lombok.jar`, if present.
- JDK runtimes 8/11/17/21 are registered from sdkman paths; 17 is the default.
- `updateBuildConfiguration` is `automatic`, so pom edits reimport on save.
- `java` is excluded from format-on-save; jdtls's stock Eclipse profile would rewrite
  files that have no formatter config. Format manually with `<leader><leader>`.
- Completion favours static members from AssertJ, Mockito and JUnit 5.

Not currently wired up (`~/.local/share/nvim/nvim-java/packages/` holds the
artifacts, but nothing loads them):
- Debug/test bundles (java-debug, vscode-java-test). `nvim-dap` binds
  `<leader>d*` in `lua/plugins/lsp.lua`, but no launch configurations are ever
  registered, so debugging and test-running do not work yet.
- Buffer-local `<localleader>` Java keymaps (organize imports, extract
  variable/constant/method, test class/method).

## AI Integration

AI tools are configured in `lua/plugins/ai.lua`:
- GitHub Copilot (copilot.vim) for inline completions
- Claude Code integration via claudecode.nvim

## Testing Changes

After making configuration changes:
1. Reload Neovim and check for startup errors
2. Run `:checkhealth` to verify plugin health
3. Test affected functionality (LSP, completion, keybindings)
4. Check `:Lazy` for any plugin load errors

## Common Tasks

- Add new plugin: Edit the matching `lua/plugins/*.lua`, add spec with appropriate lazy-loading
- Configure LSP: Modify `lua/lsp/server.lua` for server-specific settings
- Add keybinding: Edit `lua/keybinding.lua` or add to plugin spec
- Update plugins: `:Lazy update` then commit `lazy-lock.json`
- Debug plugin issues: `:Lazy profile` for load times, `:checkhealth` for diagnostics

## Important Conventions

- All Lua modules use `require()` for loading
- Plugins use lazy.nvim's spec format with event-based loading
- LSP capabilities come from blink.cmp, not nvim-cmp
- Custom highlights go in `lua/colorscheme.lua`
- Filetype-specific settings in `after/ftplugin/`
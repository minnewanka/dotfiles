# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim configuration repository using Lua with lazy.nvim plugin manager. The configuration emphasizes modularity, performance, and AI-assisted development.

## Architecture

The configuration follows a modular structure:
- `init.lua` - Entry point that loads all modules
- `lua/plugins.lua` - All plugin definitions using lazy.nvim
- `lua/settings.lua` - Core Neovim settings
- `lua/keybinding.lua` - Key mappings (leader: space, localleader: semicolon)
- `lua/lsp/` - LSP configuration split into config.lua, server.lua, and on_attach.lua
- `lazy-lock.json` - Locked plugin versions for reproducibility

## Key Development Patterns

When modifying this configuration:
1. Plugin additions go in `lua/plugins.lua` with appropriate lazy-loading events
2. LSP server configurations belong in `lua/lsp/server.lua`
3. Keybindings should be added to `lua/keybinding.lua` or in plugin specs
4. Use lazy.nvim's spec format for plugin configuration
5. Maintain performance by using lazy-loading events (VeryLazy, BufReadPre, etc.)

## Plugin Management

Uses lazy.nvim with optimized loading:
- Install/update plugins: `:Lazy` command opens UI
- Plugin specs in `lua/plugins.lua` use return table format
- Version locking via `lazy-lock.json` - commit this file for reproducibility

## LSP Configuration

LSP servers are configured in `lua/lsp/server.lua`:
- TypeScript: typescript-tools.nvim (not standard tsserver)
- Python: pyright
- Go: gopls
- Web: html, cssls, jsonls, eslint
- Uses blink.cmp for completion capabilities

When adding new LSP servers:
1. Add server configuration to `lua/lsp/server.lua`
2. Ensure mason-lspconfig includes the server name
3. Custom on_attach logic goes in `lua/lsp/on_attach.lua`

## AI Integration

Multiple AI tools are integrated:
- GitHub Copilot with CopilotChat
- CodeCompanion with custom Fidget integration (see plugins.lua:1175-1221)
- Claude Code support
- Aider integration

CodeCompanion has special Fidget progress integration that bridges status updates.

## Testing Changes

After making configuration changes:
1. Reload Neovim and check for startup errors
2. Run `:checkhealth` to verify plugin health
3. Test affected functionality (LSP, completion, keybindings)
4. Check `:Lazy` for any plugin load errors

## Common Tasks

- Add new plugin: Edit `lua/plugins.lua`, add spec with appropriate lazy-loading
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
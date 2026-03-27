---
name: Neovim config structure and plugin manager
description: LazyVim-based config at /home/paxton/.config/nvim — plugin specs go in lua/plugins/ one file per concern
type: project
---

Plugin manager: lazy.nvim bootstrapped via lua/config/lazy.lua, importing LazyVim then lua/plugins/*.lua.

Structure:
- lua/config/keymaps.lua — user keymaps (only jk/kj insert-mode Esc remaps)
- lua/config/lazy.lua — lazy.nvim bootstrap + setup
- lua/config/options.lua — options
- lua/config/autocmds.lua — autocmds
- lua/plugins/*.lua — one plugin concern per file, each returns a lazy.nvim spec table

Formatting: StyLua, 2-space indent, 120 column width (stylua.toml at repo root).

Leader key: default LazyVim `<Space>`.

**Why:** Needed for future plugin additions to match structure and avoid over-engineering.
**How to apply:** Always create one file per plugin in lua/plugins/, match the spec style in existing files, no comments unless asked.

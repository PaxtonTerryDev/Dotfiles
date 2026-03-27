# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

In nearly all cases, please avoid adding comments completely. I will explicitly request them if they are needed.

## Commits

When generating commit messages, please default to "Conventional Commit" standards.
Generally speaking, please only use commit messages, not descriptions (unless needed to denote a breaking change).
Please avoid including an authored by attribution.

## Overview

This is a Neovim configuration built on [LazyVim](https://lazyvim.github.io/) (the LazyVim distro on top of lazy.nvim plugin manager).

## Formatting

Lua files are formatted with [StyLua](https://github.com/JohnnyMorganz/StyLua): 2-space indent, 120 column width (see `stylua.toml`).

## Architecture

- `init.lua` — Entry point. Bootstraps lazy.nvim via `config.lazy`, then sets up Godot LSP integration (auto-detects `project.godot` and starts a named pipe server).
- `lua/config/lazy.lua` — lazy.nvim setup. Imports LazyVim base plugins plus everything in `lua/plugins/`.
- `lua/config/options.lua` — Vim options (extends LazyVim defaults).
- `lua/config/keymaps.lua` — Custom keymaps (loaded on VeryLazy event).
- `lua/config/autocmds.lua` — Custom autocommands (currently empty, placeholder).
- `lua/plugins/` — Each file returns a lazy.nvim plugin spec table. Files are auto-loaded by lazy.nvim.
- `lsp/` — Native LSP configs (Neovim 0.11+ `vim.lsp.config` format). Currently has `gdscript.lua`.
- `plugin/after/transparency.lua` — Forces transparent backgrounds across many highlight groups. Sourced after colorscheme loads.
- `snippets/` — Custom snippets loaded by blink.cmp (JSON format, e.g. `lua.json`).

## Theme System

The config uses a theme hot-reload system (`lua/plugins/omarchy-theme-hotreload.lua`) that listens for `LazyReload` events and dynamically swaps colorschemes. It expects a `lua/plugins/theme.lua` file (managed externally by omarchy) that specifies the active colorscheme. All available theme plugins are pre-registered in `lua/plugins/all-themes.lua` as lazy-loaded.

## Key Conventions

- Plugin customizations go in individual files under `lua/plugins/` — one concern per file.
- LazyVim extras are managed via `lazyvim.json` (currently only neo-tree).
- The `example.lua` plugin file is inert (early-returns empty table) and serves as a reference for lazy.nvim spec patterns.

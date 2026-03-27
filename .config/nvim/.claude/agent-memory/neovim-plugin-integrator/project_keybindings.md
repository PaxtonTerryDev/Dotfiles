---
name: Occupied keybindings catalog
description: All known occupied keybindings in this LazyVim config to check against before adding new ones
type: project
---

## User-defined (lua/config/keymaps.lua)
- `jk`, `kj` — insert mode Esc

## LazyVim defaults (lazyvim/config/keymaps.lua) — notable occupied slots
- `<leader>g` prefix is "git" group. Occupied: gg, gG, gL, gb, gf, gl, gB, gY, gh (group: hunks), ghs, ghr, ghS, ghu, ghR
- Snacks picker extras also occupy: gd, gD, gs, gS, gi, gI, gp, gP
- Telescope/fzf extras: gc, gl, gs, gS
- `<leader>b*` — buffer operations
- `<leader>c*` — code operations (cf=format, cd=diagnostics, co, cO, ct, cT, cb, cB, ca, cA)
- `<leader>f*` — file/find (fn=new file, ft/fT=terminal)
- `<leader>u*` — toggle options (many occupied)
- `<leader>w*` — windows (wd, wm)
- `<leader>x*` — lists (xl, xq)
- `<leader>l` — Lazy UI
- `<leader>L` — LazyVim changelog
- `<leader>K` — keywordprg
- `<leader>qq` — quit all
- `<leader>-` — split below, `<leader>|` — split right
- `<leader><tab>*` — tab operations
- `<leader>ur` — redraw/clear
- `<localleader>r` — run Lua (ft=lua)

## Installed plugins and their keys
- diffview.nvim: `<leader>gv` (DiffviewOpen), `<leader>gF` (DiffviewFileHistory %)

**Why:** Needed to avoid silent keybinding conflicts when adding new plugins.
**How to apply:** Cross-reference this list before proposing any keybindings for new plugins. Free <leader>g slots as of last audit: gv, gF, gw, gx, gz, gn, gm, gk, gj (verify extras not active first).

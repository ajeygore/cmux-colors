# cmux-colors

Interactive color configurator for [cmux](https://cmux.com) — adjust themes, sidebar tint, workspace colors, and terminal opacity without touching a config file.

## Requirements

- macOS with cmux installed (`/Applications/cmux.app`)
- Python 3 (ships with macOS)

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/ajeygore/cmux-colors/main/install.sh | bash
```

This installs `cmux-colors` into `~/bin`, `~/.local/bin`, or `~/.yadr/bin` — whichever exists first.

## Usage

```
cmux-colors
```

A menu is shown with the current values already displayed:

```
  cmux Color Settings
  ─────────────────────────────
  Theme light/dark: Catppuccin Latte / Catppuccin Mocha
  Sidebar tint:     #1a1a2e  opacity 0.2
  BG opacity:       0.85

  1) Terminal theme
  2) Sidebar tint & opacity
  3) Workspace colors
  4) Terminal background opacity
  5) Clear theme override
  q) Quit
```

After any change, cmux reloads automatically — no manual restart needed.

## What each option does

### 1 — Terminal theme

Opens cmux's built-in **live theme picker** with real-time preview across all open terminals. Navigate with arrow keys, press Enter to apply.

Over 400 themes available (Catppuccin, Tokyo Night, Dracula, Solarized, Nord, …).

### 2 — Sidebar tint & opacity

- **Tint color** — hex color applied to the cmux sidebar (e.g. `#1a1a2e`)
- **Tint opacity** — how strongly the tint blends (0.0 = none, 1.0 = solid)
- **Match terminal background** — mirror the active terminal's background color

Writes to `~/.config/cmux/cmux.json`.

### 3 — Workspace colors

Edit the 16 named colors that can be assigned to workspaces (Blue, Rose, Teal, Indigo, …). Enter the number for the color you want to change and provide a new hex value.

Writes to `~/.config/cmux/cmux.json`.

### 4 — Terminal background opacity

Controls terminal window transparency (`0.0` = fully transparent, `1.0` = fully opaque). Works with macOS window blur automatically.

Writes to `~/Library/Application Support/com.cmuxterm.app/config.ghostty`.

### 5 — Clear theme override

Removes the active theme override and falls back to the default cmux appearance.

## Config files touched

| Setting | File |
|---|---|
| Terminal theme | `~/Library/Application Support/com.cmuxterm.app/config.ghostty` |
| Sidebar tint, workspace colors | `~/.config/cmux/cmux.json` |
| Terminal opacity | `~/Library/Application Support/com.cmuxterm.app/config.ghostty` |

## License

MIT

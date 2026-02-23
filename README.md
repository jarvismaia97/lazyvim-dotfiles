# LazyVim Dotfiles

Personal Neovim configuration built on [LazyVim](https://www.lazyvim.org/) — a batteries-included Neovim setup with sensible defaults and easy customization.

## What's Included

### Theme
- **Catppuccin Mocha** (dark) with full integration for all plugins

### Languages & LSP
| Language | LSP Server | Formatter | Linter |
|----------|-----------|-----------|--------|
| TypeScript/JS | typescript-tools | prettier | eslint |
| Python | pyright | black + isort | ruff |
| Lua | lua_ls | stylua | — |
| Docker | dockerls | — | — |
| Tailwind CSS | tailwindcss | prettier | — |
| JSON/YAML | json-lsp, yaml-ls | prettier | — |
| HTML/CSS | html-lsp, css-lsp | prettier | — |
| Shell | — | shfmt | shellcheck |

### Plugins
| Plugin | What it does | Key |
|--------|-------------|-----|
| **Telescope** | Fuzzy finder for files, grep, buffers | `<Space>ff/fg/fb` |
| **Harpoon 2** | Pin & jump between files instantly | `<Space>1-5`, `<Space>a` |
| **Neo-tree** | File explorer sidebar | `<Space>e` |
| **Trouble** | Pretty diagnostics list | `<Space>xx` |
| **LazyGit** | Git UI inside Neovim | `<Space>gg` |
| **Gitsigns** | Git blame + diff in gutter | automatic |
| **Copilot** | AI code completion | automatic |
| **Conform** | Auto-format on save | automatic |
| **nvim-lint** | Async linting | automatic |
| **Which-key** | Shows available keybindings | `<Space>` + wait |
| **Noice** | Better UI for messages/cmdline | automatic |
| **Todo Comments** | Highlight TODO/FIXME/HACK | automatic |
| **Mini.surround** | Add/delete/change surroundings | `sa`, `sd`, `sr` |
| **Mini.pairs** | Auto-close brackets/quotes | automatic |

## Quick Start

### Prerequisites
- **Neovim >= 0.10** (installer handles this)
- **JetBrains Mono Nerd Font** — [download](https://www.nerdfonts.com/font-downloads)
- **Git**, **Node.js** (for LSPs), **ripgrep**, **fd**

### Install

```bash
# Clone the repo
git clone https://github.com/jarvismaia97/lazyvim-dotfiles.git ~/.dotfiles/lazyvim

# Run the installer
cd ~/.dotfiles/lazyvim
chmod +x install.sh
./install.sh

# Launch Neovim (plugins auto-install on first run)
nvim
```

### macOS (with Homebrew)

```bash
# Install dependencies first
brew install neovim ripgrep fd lazygit node

# Install JetBrains Mono Nerd Font
brew install --cask font-jetbrains-mono-nerd-font

# Then clone + install as above
```

### Linux (Ubuntu/Debian)

```bash
# Install dependencies
sudo apt install ripgrep fd-find gcc make
# Node.js: https://nodejs.org/en/download/
# Neovim: installer downloads latest from GitHub
# LazyGit: https://github.com/jesseduffield/lazygit#installation

# Then clone + install as above
```

## 60% Keyboard Setup (NuPhy Air60 V2)

This config is optimized for 60% keyboards — no F-keys or arrow keys needed.

### Caps Lock → Escape/Ctrl (recommended)

Install [Karabiner-Elements](https://karabiner-elements.pqrs.org/) and import the rule from `karabiner/karabiner.json`:

- **Tap** Caps Lock → Escape (exit insert mode instantly)
- **Hold** Caps Lock → Ctrl (for all Ctrl combos)

Or without Karabiner: System Settings → Keyboard → Modifier Keys → Caps Lock = Escape

### 60%-specific keybinds

| Key | Action | Why |
|-----|--------|-----|
| `jk` or `jj` | Exit insert mode | No Escape key reach |
| `;` | Command mode (`:`) | Skip Shift |
| `<Space>w` | Save file | No Ctrl+S needed |
| `<Space>q` | Quit | Quick close |

## Key Bindings

Leader key is **Space**.

### Navigation
| Key | Action |
|-----|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep (search in files) |
| `<Space>fb` | Open buffers |
| `<Space>fh` | Help tags |
| `<Space>fr` | Recent files |
| `<Space>fc` | Git commits |
| `<Space>e` | Toggle file explorer |
| `<S-h>` / `<S-l>` | Previous / Next buffer |

### Harpoon (file pinning)
| Key | Action |
|-----|--------|
| `<Space>a` | Add current file to harpoon |
| `<Space>h` | Open harpoon quick menu |
| `<Space>1-5` | Jump to harpoon file 1-5 |

### Code
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `<Space>ca` | Code action |
| `<Space>cr` | Rename symbol |
| `<Space>cf` | Format file |

### Git
| Key | Action |
|-----|--------|
| `<Space>gg` | Open LazyGit |
| `<Space>fc` | Search git commits |
| `<Space>fs` | Git status files |

### Diagnostics
| Key | Action |
|-----|--------|
| `<Space>xx` | Toggle Trouble (diagnostics) |
| `<Space>xX` | Buffer diagnostics only |
| `[d` / `]d` | Previous / Next diagnostic |

### Editing
| Key | Action |
|-----|--------|
| `J` (visual) | Move selected lines down |
| `K` (visual) | Move selected lines up |
| `<C-d>` / `<C-u>` | Scroll down/up (centered) |
| `<C-s>` | Save file |
| `<Space>p` | Paste without yanking |

## Customization

### Add a plugin

Create a new file in `nvim/lua/plugins/`:

```lua
-- nvim/lua/plugins/myplugin.lua
return {
  "author/plugin-name",
  opts = {
    -- plugin options
  },
}
```

### Change options

Edit `nvim/lua/config/options.lua`.

### Add keymaps

Edit `nvim/lua/config/keymaps.lua`.

### Enable more LazyVim extras

Add imports to `nvim/init.lua`:

```lua
{ import = "lazyvim.plugins.extras.lang.rust" },
{ import = "lazyvim.plugins.extras.lang.go" },
```

See all extras: https://www.lazyvim.org/extras

## Structure

```
nvim/
├── init.lua                 # Entry point (lazy.nvim bootstrap + extras)
└── lua/
    ├── config/
    │   ├── options.lua      # Neovim options (tabs, numbers, etc.)
    │   ├── keymaps.lua      # Custom key bindings
    │   └── autocmds.lua     # Auto-commands
    └── plugins/
        ├── colorscheme.lua  # Catppuccin theme config
        ├── editor.lua       # Editor plugins (telescope, neo-tree, etc.)
        ├── harpoon.lua      # Harpoon 2 config
        ├── lsp.lua          # LSP, Mason, formatting, linting
        └── ui.lua           # UI enhancements (noice, lualine, etc.)
```

## Troubleshooting

```bash
# Check health
:checkhealth

# Update all plugins
:Lazy update

# Check Mason installations
:Mason

# Reset everything (nuclear option)
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
nvim  # Reinstalls everything
```

## License

MIT

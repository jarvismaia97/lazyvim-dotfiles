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
| **Codeium** | AI code completion (free) | automatic |
| **Conform** | Auto-format on save | automatic |
| **nvim-lint** | Async linting | automatic |
| **Which-key** | Shows available keybindings | `<Space>` + wait |
| **Noice** | Better UI for messages/cmdline | automatic |
| **Todo Comments** | Highlight TODO/FIXME/HACK | automatic |
| **Mini.surround** | Add/delete/change surroundings | `sa`, `sd`, `sr` |
| **Mini.pairs** | Auto-close brackets/quotes | automatic |
| **Zen Mode** | Distraction-free coding | `<Space>z` |
| **Spectre** | Project-wide find & replace | `<Space>sr` |
| **Refactoring** | Extract function/variable, inline | `<Space>re/rv/ri` |
| **Neotest** | Run tests inline with results | `<Space>tt/tf/ts` |
| **Oil.nvim** | Edit filesystem like a buffer | `<Space>o` or `-` |
| **typescript-tools** | Faster TS LSP (replaces tsserver) | automatic |

### Shell (Zsh)
| Feature | Details |
|---------|---------|
| **Prompt** | Starship (fast, minimal, git-aware) |
| **History** | 10000 lines, shared between sessions, no duplicates |
| **Completion** | Fast auto-completion with case-insensitive matching |
| **Key bindings** | Emacs mode (Ctrl+A/E, Ctrl+W, etc.) |
| **NVM loading** | Lazy-loaded for fast startup (<200ms) |
| **FZF integration** | Fuzzy finder for files/history (if available) |

#### Zsh Aliases
| Category | Aliases |
|----------|---------|
| **Navigation** | `ll` (ls -la), `la` (ls -a), `..` (cd ..), `...` (cd ../..) |
| **Git** | `gs` (status), `ga` (add), `gc` (commit), `gp` (push), `gl` (log), `gd` (diff), `gco` (checkout), `gb` (branch), `gcm` (commit -m) |
| **pnpm** | `pn` (pnpm), `pnr` (run), `pnd` (dev), `pnb` (build), `pni` (install) |
| **Bun** | `br` (bun run), `bd` (bun dev), `bb` (bun build), `bi` (bun install) |
| **Docker** | `dk` (docker), `dkc` (docker compose), `dkps` (docker ps), `dkl` (docker logs -f) |
| **Misc** | `v` (nvim), `c` (clear), `ports` (show listening ports) |

### Tmux
| Feature | Details |
|---------|---------|
| **Prefix** | `Ctrl+A` (matching WezTerm leader) |
| **Theme** | Catppuccin Mocha (matching nvim/WezTerm) |
| **Mouse** | Full mouse support enabled |
| **Copy mode** | Vi-style with system clipboard integration |
| **Pane splits** | `prefix+\|` (horizontal), `prefix+-` (vertical) |
| **Pane nav** | `prefix+hjkl` (vim-style) |
| **Pane resize** | `prefix+HJKL` (vim-style) |
| **Windows** | Start at index 1, auto-renumber |
| **Scrollback** | 10000 lines |
| **Colors** | 256 color + true color support |
| **Status bar** | Session name, window list, time |

### WezTerm
| Feature | Details |
|---------|---------|
| **Theme** | Catppuccin Mocha (matching nvim) |
| **Font** | JetBrains Mono + ligatures |
| **Opacity** | 92% with macOS background blur |
| **Leader** | `Ctrl+A` (tmux-style) |
| **Splits** | `Leader+-` (horiz), `Leader+\|` (vert) |
| **Pane nav** | `Leader+hjkl` or `Ctrl+Shift+hjkl` |
| **Zoom pane** | `Leader+z` |
| **Tabs** | `Cmd+1-9` or `Leader+c/n/p` |
| **Status bar** | Current directory + time |
| **GPU** | WebGpu frontend, 120fps |

## Quick Start

### Prerequisites
- **Neovim >= 0.10** (installer handles this)
- **JetBrains Mono Nerd Font** — [download](https://www.nerdfonts.com/font-downloads)
- **Git**, **Node.js** (for LSPs), **ripgrep**, **fd**
- **Zsh** (default on macOS, install on Linux)
- **Starship prompt** — `brew install starship` or see [starship.rs](https://starship.rs)
- **Tmux** — `brew install tmux` (optional, for terminal multiplexing)

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
brew install neovim ripgrep fd lazygit node starship tmux

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

## Shell & Terminal Keybindings

### Tmux (prefix = Ctrl+A)
| Key | Action |
|-----|--------|
| `prefix+\|` | Split pane horizontally |
| `prefix+-` | Split pane vertically |
| `prefix+h/j/k/l` | Navigate panes (vim-style) |
| `prefix+H/J/K/L` | Resize panes (vim-style) |
| `prefix+c` | Create new window |
| `prefix+p/n` | Previous/next window |
| `prefix+1-9` | Switch to window number |
| `prefix+r` | Reload tmux config |
| `prefix+[` | Enter copy mode (vi-style) |
| `prefix+?` | Show all key bindings |

### Zsh
| Key | Action |
|-----|--------|
| `Ctrl+R` | Search command history (with FZF if available) |
| `Ctrl+T` | Search files (with FZF if available) |
| `Alt+C` | Change directory (with FZF if available) |
| `Ctrl+A` | Move to beginning of line |
| `Ctrl+E` | Move to end of line |
| `Ctrl+W` | Delete word backwards |
| `Up/Down` | History search |
| `Ctrl+Left/Right` | Jump between words |

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

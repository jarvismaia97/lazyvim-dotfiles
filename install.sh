#!/bin/bash
# LazyVim Dotfiles Installer
# Usage: ./install.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_CONFIG="$HOME/.config/nvim"
MIN_NVIM_VERSION="0.10"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

info()  { echo -e "${BLUE}[INFO]${NC} $1"; }
ok()    { echo -e "${GREEN}[OK]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

echo ""
echo "╔═══════════════════════════════════════╗"
echo "║       LazyVim Dotfiles Installer      ║"
echo "╚═══════════════════════════════════════╝"
echo ""

# ── 1. Check/Install Neovim ──────────────────────────────────
if command -v nvim &>/dev/null; then
  NVIM_VERSION=$(nvim --version | head -1 | grep -oP '\d+\.\d+')
  if [ "$(printf '%s\n' "$MIN_NVIM_VERSION" "$NVIM_VERSION" | sort -V | head -1)" = "$MIN_NVIM_VERSION" ]; then
    ok "Neovim $NVIM_VERSION found (>= $MIN_NVIM_VERSION)"
  else
    error "Neovim $NVIM_VERSION is too old. Need >= $MIN_NVIM_VERSION"
  fi
else
  warn "Neovim not found. Installing..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    if command -v brew &>/dev/null; then
      brew install neovim
    else
      error "Homebrew not found. Install from https://brew.sh first."
    fi
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Install latest from GitHub releases
    info "Downloading Neovim from GitHub releases..."
    ARCH=$(uname -m)
    if [ "$ARCH" = "x86_64" ]; then
      NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
    elif [ "$ARCH" = "aarch64" ]; then
      NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz"
    else
      error "Unsupported architecture: $ARCH"
    fi
    curl -LO "$NVIM_URL"
    sudo tar xzf "nvim-linux-*.tar.gz" -C /opt/
    sudo ln -sf /opt/nvim-linux-*/bin/nvim /usr/local/bin/nvim
    rm -f nvim-linux-*.tar.gz
  fi
  ok "Neovim installed: $(nvim --version | head -1)"
fi

# ── 2. Install dependencies ──────────────────────────────────
info "Checking dependencies..."

DEPS=("git" "gcc" "make" "ripgrep" "fd" "lazygit" "node")
MISSING=()

for dep in "${DEPS[@]}"; do
  if ! command -v "$dep" &>/dev/null; then
    MISSING+=("$dep")
  fi
done

if [ ${#MISSING[@]} -gt 0 ]; then
  warn "Missing: ${MISSING[*]}"
  if [[ "$OSTYPE" == "darwin"* ]] && command -v brew &>/dev/null; then
    info "Installing via Homebrew..."
    for dep in "${MISSING[@]}"; do
      brew install "$dep" 2>/dev/null || true
    done
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    warn "Please install manually: ${MISSING[*]}"
    warn "  Ubuntu/Debian: sudo apt install ${MISSING[*]}"
    warn "  For lazygit: https://github.com/jesseduffield/lazygit#installation"
  fi
fi

ok "Dependencies checked"

# ── 3. Backup existing config ────────────────────────────────
if [ -d "$NVIM_CONFIG" ] || [ -L "$NVIM_CONFIG" ]; then
  BACKUP="$NVIM_CONFIG.bak.$(date +%Y%m%d_%H%M%S)"
  warn "Existing config found at $NVIM_CONFIG"
  info "Backing up to $BACKUP"
  mv "$NVIM_CONFIG" "$BACKUP"
  ok "Backup created"
fi

# Also clean Neovim cache/state (for fresh start)
if [ -d "$HOME/.local/share/nvim" ]; then
  warn "Cleaning Neovim data (plugins will be reinstalled)..."
  rm -rf "$HOME/.local/share/nvim"
  rm -rf "$HOME/.local/state/nvim"
  rm -rf "$HOME/.cache/nvim"
fi

# ── 4. Symlink config ────────────────────────────────────────
info "Symlinking $SCRIPT_DIR/nvim → $NVIM_CONFIG"
mkdir -p "$(dirname "$NVIM_CONFIG")"
ln -sf "$SCRIPT_DIR/nvim" "$NVIM_CONFIG"
ok "Config linked"

# ── 5. First launch info ─────────────────────────────────────
echo ""
echo "╔═══════════════════════════════════════╗"
echo "║           Setup Complete! 🚀          ║"
echo "╚═══════════════════════════════════════╝"
echo ""
info "Next steps:"
echo "  1. Run 'nvim' — plugins will auto-install on first launch"
echo "  2. Wait for Mason to install LSPs/formatters (~1 min)"
echo "  3. Run ':checkhealth' to verify everything works"
echo ""
info "Font: Make sure JetBrains Mono Nerd Font is set in your terminal"
echo "  - WezTerm: already configured if using our wezterm.lua"
echo "  - iTerm2: Preferences → Profiles → Text → Font"
echo "  - Alacritty: font.normal.family = 'JetBrainsMono Nerd Font'"
echo ""
info "Key keybindings (Space is leader):"
echo "  Space+ff  Find files        Space+fg  Live grep"
echo "  Space+e   File explorer     Space+gg  LazyGit"
echo "  Space+1-5 Harpoon marks     Space+a   Add harpoon mark"
echo "  Space+xx  Diagnostics       gd        Go to definition"
echo "  Space+ca  Code action       K         Hover docs"
echo ""
ok "Happy coding! 🎉"

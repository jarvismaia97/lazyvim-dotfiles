# ~/.zshrc - Fast, Clean Zsh Config
# ═══════════════════════════════════════

# ── Performance: Early Exit for Non-Interactive ──
[[ $- != *i* ]] && return

# ── History Configuration ──
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY          # Share history between sessions
setopt HIST_IGNORE_DUPS       # Don't record duplicates
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicates
setopt HIST_FIND_NO_DUPS      # Don't show duplicates in search
setopt HIST_IGNORE_SPACE      # Ignore commands starting with space
setopt HIST_VERIFY            # Show command before executing from history
setopt INC_APPEND_HISTORY     # Add commands immediately

# ── Key Bindings (Emacs Mode) ──
bindkey -e
bindkey '^[[A' history-search-backward   # Up arrow
bindkey '^[[B' history-search-forward    # Down arrow
bindkey '^[[1;5C' forward-word           # Ctrl+Right
bindkey '^[[1;5D' backward-word          # Ctrl+Left

# ── Auto-completion Setup ──
autoload -Uz compinit
# Speed up compinit by checking only once per day
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null) ]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive matching

# ── PATH Configuration ──
# Homebrew (M1/M2 Macs)
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Local bin
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Bun
if [[ -d "$HOME/.bun" ]]; then
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

# pnpm
if [[ -d "$HOME/.local/share/pnpm" ]]; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi

# ── NVM (Lazy Loading for Fast Startup) ──
export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  # Lazy load NVM
  declare -a __node_commands=('nvm' 'node' 'npm' 'npx' 'yarn')
  
  function __init_nvm() {
    for cmd in "${__node_commands[@]}"; do unalias $cmd 2>/dev/null; done
    source "$NVM_DIR/nvm.sh"
    [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
    unset __node_commands
    unfunction __init_nvm
  }
  
  for cmd in "${__node_commands[@]}"; do
    alias $cmd='__init_nvm && '$cmd
  done
fi

# ── Useful Aliases ──

# Navigation
alias ll="ls -la"
alias la="ls -a"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline -20"
alias gd="git diff"
alias gco="git checkout"
alias gb="git branch"
alias gcm="git commit -m"
alias gpl="git pull"
alias gf="git fetch"
alias glo="git log --oneline --graph --all --decorate"

# pnpm aliases
alias pn="pnpm"
alias pnr="pnpm run"
alias pnd="pnpm dev"
alias pnb="pnpm build"
alias pni="pnpm install"
alias pna="pnpm add"
alias pnrm="pnpm remove"

# Bun aliases
alias br="bun run"
alias bd="bun dev"
alias bb="bun build"
alias bi="bun install"
alias ba="bun add"

# Docker aliases
alias dk="docker"
alias dkc="docker compose"
alias dkps="docker ps"
alias dkl="docker logs -f"
alias dki="docker images"
alias dkrm="docker rm"
alias dkrmi="docker rmi"
alias dkpsa="docker ps -a"

# Miscellaneous aliases
alias v="nvim"
alias c="clear"
alias ports="lsof -i -P -n | grep LISTEN"
alias reload="source ~/.zshrc"
alias zshrc="nvim ~/.zshrc"
alias tmuxrc="nvim ~/.tmux.conf"

# macOS specific
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias brew-update="brew update && brew upgrade && brew cleanup"
  alias flush-dns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
fi

# ── Environment Variables ──
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export LESS="-R"

# Colors for ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ── FZF Integration (if available) ──
if command -v fzf &>/dev/null; then
  source <(fzf --zsh) 2>/dev/null || true
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
  
  # Use ripgrep for FZF if available
  if command -v rg &>/dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
fi

# ── Starship Prompt ──
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
else
  # Fallback prompt if Starship not available
  autoload -Uz vcs_info
  precmd() { vcs_info }
  
  zstyle ':vcs_info:git:*' formats ' (%b)'
  setopt PROMPT_SUBST
  PROMPT='%F{cyan}%1~%f%F{yellow}${vcs_info_msg_0_}%f %# '
fi

# ── Load Local Customizations ──
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ── Performance: Print startup time (debug) ──
# Uncomment to debug slow startup:
# echo "Zsh startup: ${SECONDS}s"
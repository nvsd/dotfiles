# Git auto-complete
autoload -Uz compinit && compinit

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:$HOME/.local/bin

alias db:psql="psql postgresql://postgres:postgres@localhost:5432"
alias db="pgcli postgresql://postgres:postgres@localhost:5432"
alias ll='ls -al'
alias ls='exa'
alias cat='bat'
alias lg='lazygit'
alias python='python3'
alias pip='pip3'
alias mux='tmuxinator'
alias gdb='arm-none-eabi-gdb'
alias che='chezmoi'

alias changevim="nvim ~/.config/nvim/init.lua"
alias wez="nvim ~/.wezterm.lua"
alias dot="z dotfiles"
alias ard="arduino-cli"

# Git
alias pull="git fetch origin main:main"

# General
alias proj="cd ~/Projects"
alias change="nvim ~/.zshrc"
alias delete="rm -rf"
alias update="source ~/.zshrc"

export EDITOR='nvim'

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

eval "$(zoxide init zsh)"

source /opt/homebrew/opt/spaceship/spaceship.zsh

# pnpm
export PNPM_HOME="/Users/zack/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

eval "$(direnv hook zsh)"

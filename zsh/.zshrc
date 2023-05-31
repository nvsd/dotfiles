source /opt/homebrew/opt/spaceship/spaceship.zsh
# Git auto-complete
autoload -Uz compinit && compinit

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

# Git
alias pull="git fetch origin main:main"

# General
alias proj="cd ~/Projects"
alias change="nvim ~/.zshrc"
alias delete="rm -rf"
alias update="source ~/.zshrc"

export EDITOR='nvim'

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=/Users/zacknovosad/.nvm/versions/node/v20.0.0/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/zacknovosad/.nvm/versions/node/v20.0.0/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/Users/zacknovosad/.cargo/bin:/Users/zacknovosad/.dotnet:/Users/zacknovosad/.dotnet/tools:/Users/zacknovosad/.dotnet:/Users/zacknovosad/.dotnet/tools:~/Projects/nand2tetris/tools

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"

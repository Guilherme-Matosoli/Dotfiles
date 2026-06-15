# OhMyZsh config
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting fzf-tab)
source $ZSH/oh-my-zsh.sh
# End OhMyZsh config

# VI Mode
bindkey -v
# Cursor shape per vi mode
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] || [[ $1 == 'block' ]]; then
    echo -ne '\e[1 q'  # block = normal mode
  elif [[ $KEYMAP == viins ]] || [[ $KEYMAP == 'main' ]] || [[ $1 == 'beam' ]]; then
    echo -ne '\e[5 q'  # beam/pipe = insert mode
  fi
}
zle -N zle-keymap-select

# Block cursor on startup
zle-line-init() { echo -ne '\e[1 q' }
zle -N zle-line-init
# END VI Mode

# Aliases
alias c="clear"
alias v="nvim"
alias e="exit"

alias gpa="git push origin HEAD"
alias gs="git status -s"
# End Aliases

export PATH="$PATH:/opt/nvim/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Start tmux automatically if not already inside a session or connected via SSH
if [ -z "$TMUX" ] && [ -z "$SSH_CONNECTION" ] && [[ $- == *i* ]]; then
    exec tmux new-session -A -s main -f ~/.
fi

# Dotfiles bare repo
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

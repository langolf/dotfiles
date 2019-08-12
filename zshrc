# Make the $path array have unique values.
typeset -U path

add_to_path_once() {
  path=("$1" $path)
}
BREW_PREFIX="$(brew --prefix)"

setopt vi
autoload edit-command-line && zle -N edit-command-line

autoload -Uz compinit

source "$HOME/.zplugin/bin/zplugin.zsh"
zplugin light zsh-users/zsh-completions 


# zplugin light zsh-users/zsh-autosuggestions
# zplugin light hlissner/zsh-autopair

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure
    

# Load skim
# source ~/.skim/shell/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


zplugin ice wait"0" lucid atinit"zpcompinit; zpcdreplay"

if [ -f /usr/local/etc/profile.d/autojump.sh ]; then
  . /usr/local/etc/profile.d/autojump.sh
fi

# Enable keychain
if [ -f "$HOME/.ssh/id_rsa" ]; then
  eval `keychain --eval --quiet --agents ssh id_rsa`
fi

# Unset local functions and variables
unset BREW_PREFIX
unset -f add_to_path_once

# Define aliases
if [ -f "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# Source local zshrc
if [ -f "$HOME/.zprofile" ]; then
  source "$HOME/.zprofile"
fi

# Source local zshrc
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

source "$HOME/.nvm/nvm.sh"

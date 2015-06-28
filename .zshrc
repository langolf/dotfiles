# Setup locale
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8


# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git brew osx npm github ssh ssh-agent node sublime)

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Add sourses
export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export DOTFILES=$HOME/dotfiles
source $DOTFILES/.exports
source $DOTFILES/.aliases
source $ZSH/oh-my-zsh.sh

export EDITOR="/usr/local/bin/nvim"
export TERM=xterm-256color

# For rbenv
eval "$(rbenv init -)"

. `brew --prefix`/etc/profile.d/z.sh
# Setup locale
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8


# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git brew osx npm github ssh ssh-agent node sublime)

export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Add sourses
export DOTFILES=$HOME/dotfiles
source $DOTFILES/.exports
source $ZSH/oh-my-zsh.sh
source $DOTFILES/.aliases

export EDITOR="/usr/local/bin/nvim"
export TERM=xterm-256color
export COLORTERM=xterm-256color


# For rbenv
eval "$(rbenv init -)"

. `brew --prefix`/etc/profile.d/z.sh
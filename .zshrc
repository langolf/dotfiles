# Setup locale
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8


# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git brew osx npm github ruby rbenv bundler gem ssh ssh-agent node rails rake)

export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Add sourses
export DOTFILES=$HOME/.dotfiles
source $DOTFILES/.exports
source $ZSH/oh-my-zsh.sh
source $DOTFILES/.aliases

MARKUP="193.232.168.38"
export EDITOR="/usr/local/bin/nvim"
NVIM_TUI_ENABLE_TRUE_COLOR=1


# For rbenv
eval "$(rbenv init -)"


source ~/.xsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Path to your oh-my-zsh installation.
export ZSH=/Users/langolf/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="honukai"

COMPLETION_WAITING_DOTS="true"
plugins=(ssh ssh-agent git brew osx npm github node sublime rsync tmux zsh-syntax-highlighting gulp)

export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"

source $ZSH/oh-my-zsh.sh

#ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

export TERM=xterm-256color

export EDITOR="/usr/local/bin/nvim"
export TERM=screen-256color
export MYVIMRC="~/.vimrc"
export FZF_DEFAULT_COMMAND='ag -g ""'

#Git
alias gs="git status"
alias gc="git commit"
alias go="git checkout"
alias gb="git branch"
alias ga="git add"

#Vim
alias vim="/usr/local/bin/vim"
alias v="nvim"
alias r="ranger"

# For rbenv
eval "$(rbenv init -)"
 . `brew --prefix`/etc/profile.d/z.sh

export NVM_DIR="/Users/langolf/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

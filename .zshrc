export ZSH=~/.oh-my-zsh

# COMPLETION_WAITING_DOTS="true"
plugins=(ssh ssh-agent git brew osx npm github node rails rsync tmux gulp k docker)

export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color

export EDITOR="/usr/local/bin/nvim"
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
alias tmux="env TERM=xterm-256color tmux"

alias r="ranger"

# For rbenv
 . `brew --prefix`/etc/profile.d/z.sh // for z

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

local ret_status="%(?:%{$fg[blue]%} ▲  →  :%{$fg[red]%} ▲  →  )"
PROMPT='${ret_status}%{$reset_color%}'

# j Autojump to directory
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

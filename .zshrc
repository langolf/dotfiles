# Path to your oh-my-zsh installation.
export ZSH=/Users/langolf/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"

# COMPLETION_WAITING_DOTS="true"
plugins=(ssh ssh-agent git brew osx npm github node rails rsync tmux gulp k zsh-syntax-highlighting docker)

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
export MYVIMRC="~/.vimrc"
export FZF_DEFAULT_COMMAND='ag -g ""'

export DOCKER_HOST="tcp://172.16.62.130:2376"
export DOCKER_MACHINE_NAME=default
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH="/Users/langolf/.docker/machine/machines/default"

# For docker
eval $(docker-machine env default)

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

# Search branch
fbr() {
  local branches branch
  branches=$(git branch -a) &&
  branch=$(echo "$branches" | fzf +s +m -e) &&
  git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}


# For rbenv
eval "$(rbenv init -)"
 . `brew --prefix`/etc/profile.d/z.sh // for z

# eval "$(fasd --init zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install auto)"

export NVM_DIR="/Users/langolf/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

local ret_status="%(?:%{$fg[blue]%} ▲  →  :%{$fg[red]%} ▲  →  )"
PROMPT='${ret_status}%{$reset_color%}'
# RPROMPT='%{$fg[$NCOLOR]%}%p $(git_prompt_info)%{$reset_color%}'

# j Autojump to directory
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

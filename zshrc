# Make the $path array have unique values.
typeset -U path

add_to_path_once() {
  path=("$1" $path)
}

if command -v brew >/dev/null; then
  BREW_PREFIX="$(brew --prefix)"
fi

# Use Zplugin
if [ ! -e "$HOME/.zplugin/bin/zplugin.zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi
source "$HOME/.zplugin/bin/zplugin.zsh"

zplugin ice lucid wait'0' blockf
zplugin light zsh-users/zsh-completions 
zplugin light zdharma/fast-syntax-highlighting

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure
export PURE_PROMPT_SYMBOL=λ

zplugin light yous/vanilli.sh

zplugin ice lucid wait'0' atinit'zpcompinit; zpcdreplay'
zplugin ice wait''
zplugin light lukechilds/zsh-better-npm-completion

zplugin ice svn
zplugin snippet 'OMZ::plugins/brew'
zplugin ice svn
zplugin snippet 'OMZ::plugins/yarn'

zplugin ice wait'0b' lucid
zplugin light -b zsh-users/zsh-autosuggestions
zplugin light hlissner/zsh-autopair

# Load completion
HYPHEN_INSENSITIVE=true
COMPLETION_WAITING_DOTS=true
zplugin snippet 'OMZ::lib/completion.zsh'
    
zplugin ice lucid wait'[[ $+functions[_zsh_highlight] -ne 0 ]]' atload' \
  zmodload zsh/terminfo; \
  [ -n "${terminfo[kcuu1]}" ] && bindkey "${terminfo[kcuu1]}" history-substring-search-up; \
  [ -n "${terminfo[kcud1]}" ] && bindkey "${terminfo[kcud1]}" history-substring-search-down; \
  bindkey -M emacs "^P" history-substring-search-up; \
  bindkey -M emacs "^N" history-substring-search-down; \
  bindkey -M vicmd "k" history-substring-search-up; \
  bindkey -M vicmd "j" history-substring-search-down; \
'
zplugin light zsh-users/zsh-history-substring-search


# Load autojump
if command -v autojump >/dev/null; then
  if [ -f "$HOME/.autojump/etc/profile.d/autojump.sh" ]; then
    source "$HOME/.autojump/etc/profile.d/autojump.sh"
  elif [ -f /etc/profile.d/autojump.zsh ]; then
    source /etc/profile.d/autojump.zsh
  elif [ -f /usr/share/autojump/autojump.zsh ]; then
    source /usr/share/autojump/autojump.zsh
  elif [ -n "$BREW_PREFIX" ]; then
    if [ -f "$BREW_PREFIX/etc/autojump.sh" ]; then
      source "$BREW_PREFIX/etc/autojump.sh"
    fi
  fi
elif [ -f "$HOME/.autojump/etc/profile.d/autojump.sh" ]; then
  source "$HOME/.autojump/etc/profile.d/autojump.sh"
fi

# Load fzf
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh

  # fshow - git commit browser
  fshow() {
    git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(green)%cr%C(reset)" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                 xargs -I % sh -c 'git show --color=always %'" \
      --bind "ctrl-m:execute:
        (grep -o '[a-f0-9]\{7\}' | head -1 |
        xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
        {}
FZF-EOF"
  }
fi

zplugin ice lucid wait"0" pick"bash/base16-tomorrow-night.config" src"bash/base16-tomorrow-night.config" nocompile'!'
zplugin light nicodebo/base16-fzf 

export NVM_SYMLINK_CURRENT=true
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true
zplugin light lukechilds/zsh-nvm

# Enable keychain
if command -v keychain >/dev/null; then
  if [ -f "$HOME/.ssh/id_rsa" ]; then
    eval `keychain --eval --quiet --agents ssh id_rsa`
  elif [ -f "$HOME/.ssh/id_ed25519" ]; then
    eval `keychain --eval --quiet --agents ssh id_ed25519`
  fi
fi

# Load skim
# source ~/.skim/shell/key-bindings.zsh

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

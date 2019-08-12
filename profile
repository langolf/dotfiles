UNAME="$(uname)"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.utf-8
export LC_ALL=en_US.utf-8

# if [ -n "$ZSH_VERSION" ]; then
#   # Oh My Zsh sets custom LSCOLORS from lib/theme-and-appearance.zsh
#   # This is default LSCOLORS from the man page of ls
#   [ "$UNAME" = 'Darwin' ] && export LSCOLORS=exfxcxdxbxegedabagacad
# fi

add_to_path_once() {
  case ":$PATH:" in
    *":$1:"*)
      ;;
    *)
      export PATH="$1:$PATH"
      ;;
  esac
}

# Add /usr/local/bin to PATH for Mac OS X
add_to_path_once "/usr/local/bin:/usr/local/sbin:/usr/local"

# Set PATH to include user's bin if it exists
if [ -d "$HOME/bin" ]; then
  add_to_path_once "$HOME/bin"
fi
if [ -d "$HOME/.local/bin" ]; then
  add_to_path_once "$HOME/.local/bin"
fi

# Set GOPATH for Go
if command -v go >/dev/null; then
  [ ! -e "$HOME/.go" ] && mkdir "$HOME/.go"
  export GOPATH="$HOME/.go"
  case ":$PATH:" in
    *":$GOPATH/bin:"*)
      ;;
    *)
      export PATH="$PATH:$GOPATH/bin"
      ;;
  esac
fi

add_to_path_once "$HOME/.nvm"
add_to_path_once "$HOME/.cargo/bin"
add_to_path_once "/usr/local/opt/libxml2/bin"
add_to_path_once "$HOME/.hammerspoon"

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi



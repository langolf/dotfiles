#!/bin/bash

#brew
brew update

brew install neovim --HEAD
brew install the_silver_searcher
brew install ranger
brew install vifm
brew install tig
brew install tmux
brew install git
brew install zsh

brew install fzf
# Install shell extensions
/usr/local/opt/fzf/install

export DOTFILES=$HOME/dotfiles

ln -s $DOTFILES/.zshrc     $HOME/.zshrc
ln -s $DOTFILES/.vimrc     $HOME/.vimrc
ln -s $DOTFILES/.gitignore $HOME/.gitignore
ln -s $DOTFILES/.tmux      $HOME/.tmux
ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf

defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false
defaults write com.github.atom ApplePressAndHoldEnabled -bool false

# GIT configuration
git config --global user.name "Aleksandr Langolf"
git config --global user.email sasha.langolf@gmail.com
git config --global core.editor nvim
git config --global merge.tool vimdiff
git config --global push.default simple

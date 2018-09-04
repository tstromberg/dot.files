#!/bin/sh
#
# Script to configure a brand new desktop machine.
start=$(pwd)
git pull

sudo apt install -y \
  code \
  fonts-inconsolata \
  fonts-open-sans \
  i3 \
  i3blocks \
  i3status \
  tilix \
  vim-gnome \
  xautolock \
  zsh

# nice to haves
sudo apt install -y \
  xscreensaver-screensaver-bsod

if [[ ! -d "$HOME/.fonts/adobe-fonts" ]]; then
  git clone --depth 1 --branch release \
    https://github.com/adobe-fonts/source-code-pro.git \
    ~/.fonts/adobe-fonts/source-code-pro
  fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
fi


if [[ ! -L "$HOME/.zprofile" ]]; then
  ./install.sh
fi

test -d $HOME/.vim/bundle/Vundle.git \
  && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim





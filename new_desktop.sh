#!/bin/sh
set -eux -o pipefail

#
# Script to configure a brand new desktop machine.
start=$(pwd)
git pull

sudo apt install -y \
  code \
  curl \
  fonts-inconsolata \
  fonts-open-sans \
  i3 \
  i3blocks \
  i3status \
  tilix \
  workrave \
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

if [[ ! -d /usr/lib/google-golang && ! -d /usr/local/go ]]; then
  sudo mkdir -p /usr/local/go
  sudo chown $USER /usr/local/go
  goarch=`echo "$(uname)-$(uname -m)" | tr "[A-Z]" "[a-z]" | sed s/x86_/amd/g`
  url=$(curl -s https://golang.org/dl/ |  grep -o "https://.*$goarch.tar.gz\"" | sed s/\"// | head -n1)
  curl -s $url | tar -C /usr/local -zxvf -
fi

go get -u github.com/golangci/golangci-lint/cmd/golangci-lint

if [[ ! -L "$HOME/.zprofile" ]]; then
  ./install.sh
fi

test -d $HOME/.vim/bundle/Vundle.git \
  && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


echo "DONE: New Desktop!"


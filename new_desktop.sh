#!/bin/sh
set -eux -o pipefail

start=$(pwd)
os=$(uname)

git pull

if [[ -x "new_${os}.sh" ]]; then
  . ./new_${os}.sh
fi

if [[ ! -d /usr/lib/google-golang && ! -d /usr/local/go ]]; then
  sudo mkdir -p /usr/local/go
  sudo chown $USER /usr/local/go
  goarch=`echo "$(uname)-$(uname -m)" | tr "[A-Z]" "[a-z]" | sed s/x86_/amd/g`
  url=$(curl -s https://golang.org/dl/ |  grep -o "https://.*$goarch.tar.gz\"" | sed s/\"// | head -n1)
  curl -s $url | tar -C /usr/local -zxvf -
fi
export PATH=/usr/local/go/bin:$PATH

if [[ ! -x "$HOME/go/bin/golangci-lint" ]]; then
  go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
fi

if [[ ! -x "$HOME/go/bin/goreturns" ]]; then
  go get sourcegraph.com/sqs/goreturns
fi

if [[ ! -x "$HOME/go/bin/hub" ]]; then
  go get github.com/github/hub && cd $HOME/src/github.com/github/hub && make install
fi

mkdir -p ~/bin
if [[ ! -L "$HOME/bin/hub" ]]; then
  ln -s $HOME/go/bin/hub $HOME/bin/hub
fi

if [[ ! -L "$HOME/.zprofile" ]]; then
  ./install.sh
fi

if [[ ! -f "$HOME/.config/fish/conf.d/omf.fish" || ! -d $HOME/src/oh-my-fish ]]; then
  mkdir -p $HOME/src
  git clone https://github.com/oh-my-fish/oh-my-fish $HOME/src/oh-my-fish
  cd $HOME/src/oh-my-fish && bin/install --offline
fi

if [[ ! -L "$HOME/.config/fish/functions/fish_prompt.fish" ]]; then
  fish -c "omf install bobthefish"
  fish -c "omf install gityaw"
fi

test -d $HOME/.vim/bundle/Vundle.vim/.git \
  || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "DONE: New Desktop!"

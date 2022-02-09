!/bin/sh
set -eux
# -o pipefail

start=$(pwd)
os=$(uname)
arch=$(uname -m)

git pull


if [ ! -x "$HOME/go/bin/golangci-lint" ]; then
  go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
fi

if [ ! -L "$HOME/.zprofile" ]; then
  ./install.sh
fi

if [ ! -d $HOME/src/oh-my-fish ]; then
  mkdir -p $HOME/src
  git clone https://github.com/oh-my-fish/oh-my-fish $HOME/src/oh-my-fish
fi

if [ -x "new_${os}.sh" ]; then
  . ./new_${os}.sh
fi

if [ ! -f "$HOME/.config/fish/conf.d/omf.fish" ]; then
  cd $HOME/src/oh-my-fish && bin/install --offline
fi

if [ ! -L "$HOME/.config/fish/functions/fish_prompt.fish" ]; then
  fish -c "omf install bobthefish"
  fish -c "omf install gityaw"
fi

if [ ! -e "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
 curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "DONE: New Desktop!"

arch=$(uname -m)

if [ "${arch}" = "arm64" ]; then
  brewroot="/opt/homebrew"
  brewbin="/opt/homebrew/bin"
  brewopts="--build-from-source"
else
  brewroot="/usr/local/Homebrew"
  brewbin="/usr/local/bin"
  brewopts=""
fi

if [ ! -x "${brewbin}/brew" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

test -x $brewbin/fish -o -x /usr/local/bin/fish || brew install ${brewopts} fish
test -x $brewbin/shellcheck || brew install ${brewopts} shellcheck
test -x $brewbin/openssh || brew install ${brewopts} openssh
test -x $brewbin/go || brew install ${brewopts} go
test -x $brewbin/nvim || brew install ${brewopts} nvim

if [ ! -f "$HOME/Library/Fonts/Source Code Pro for Powerline.otf" ]; then
  cd /tmp
  if [ ! -f "/tmp/fonts/install.sh" ]; then
    git clone https://github.com/powerline/fonts.git --depth=1
  fi
  cd fonts
  ./install.sh
fi

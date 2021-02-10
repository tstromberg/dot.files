arch=$(uname -m)
if [[ "${arch}" = "arm64" ]]; then
  brewroot="/opt/homebrew"
  brewbin="/opt/homebrew/bin"
  brewopts="--build-from-source"
else
  brewroot="/usr/local/Homebrew"
  brewbin="/usr/local/bin"
  brewopts=""
fi

if [[ ! -d "${brewroot}" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

test -x $brewbin/fish -o /usr/local/bin/fish || brew install ${brewopts} fish
#test -x $brewbin/shellcheck || brew install ${brewopts} shellcheck
#test -f "/Users/tstromberg/Library/Fonts/Sauce Code Powerline Regular.otf" || brew cask install font-source-code-pro-for-powerline

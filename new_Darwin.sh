
if [[ ! -d /usr/local/Homebrew ]]; then
  curl -O https://raw.githubusercontent.com/Homebrew/install/master/install
  ruby install
fi

test -x /usr/local/bin/fish || brew install fish
test -x /usr/local/bin/shellcheck || brew install shellcheck
test -f "/Users/tstromberg/Library/Fonts/Sauce Code Powerline Regular.otf" || brew cask install font-source-code-pro-for-powerline

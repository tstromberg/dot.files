if [ -x /usr/bin/apt ]; then
	$SUDO apt install -y \
	  cmake \
	  fish \
	  git \
	  curl \
	  fonts-inconsolata \
	  fonts-open-sans \
	  fonts-powerline \
	  i3 \
	  i3blocks \
	  i3status \
	  inotify-tools \
	  tilix \
	  workrave \
	  vim-gtk3 \
	  xautolock \
    doas

	# nice to haves
	$SUDO apt install -y code xscreensaver-screensaver-bsod || echo "no code or bsod"
fi

if [ -x /usr/bin/yay ]; then
   yay -Syu
   yay -S google-chrome
fi

if [ -x /usr/bin/pacman ]; then
  $SUDO pacman -S fish powerline ttf-opensans rsync workrave neovim doas go vscode nodejs npm tmux
fi

if [ ! -d "$HOME/.fonts/adobe-fonts" ]; then
  git clone --depth 1 --branch release \
    https://github.com/adobe-fonts/source-code-pro.git \
    ~/.fonts/adobe-fonts/source-code-pro
  fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
fi

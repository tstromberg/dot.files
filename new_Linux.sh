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
   yay -S google-chrome \
	code \
	doas \
    fish \
	go \
	jq \
	kubectl \
	libfido2 \
	neovim \
	npm \
	nushell \
	openbsd-netcat \
	powerline \
	rsync \
	starship \
	strace \
	spotify-bin \
	syft \
	tcpdump \
	tmux \
	ttf-opensans \
	workrave
fi

if [ ! -d "$HOME/.fonts/adobe-fonts" ]; then
  git clone --depth 1 --branch release \
    https://github.com/adobe-fonts/source-code-pro.git \
    ~/.fonts/adobe-fonts/source-code-pro
  fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro || false
fi

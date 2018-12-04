
sudo apt install -y \
  fish \
  git \
  curl \
  fonts-inconsolata \
  fonts-open-sans \
  i3 \
  i3blocks \
  i3status \
  inotify-tools \
  tilix \
  workrave \
  vim-gnome \
  xautolock \
  zsh

# nice to haves
sudo apt install -y code xscreensaver-screensaver-bsod || echo "no code or bsod"

if [[ ! -d "$HOME/.fonts/adobe-fonts" ]]; then
  git clone --depth 1 --branch release \
    https://github.com/adobe-fonts/source-code-pro.git \
    ~/.fonts/adobe-fonts/source-code-pro
  fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
fi

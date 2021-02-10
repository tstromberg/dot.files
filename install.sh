#!/bin/sh
set -euf
cd `dirname $0`
mkdir -p "${HOME}/.config"

dconf_update() {
  local subpath=$1
  local f=$2

  if [ -z "${DISPLAY}" ]; then
    echo "[---] ${f}"
    return
  fi
  dump=$(mktemp -q)
  dconf dump ${subpath} > "${dump}"
  if ! diff "${dump}" ${f}; then
    echo "[dcf] ${f}"
    dconf load ${subpath} < ${f}
  fi
}

fs="`ls | egrep -v "README|\.sh"` zprofile"
for f in $fs
do
  if [ "${f}" = "tilix.conf" ]; then
    if [ "$(uname)" = "Linux" ]; then 
      dconf_update /com/gexperts/Tilix/ "${f}"
    fi
  fi

  full="$(pwd)/$f"
  if [ "${f}" = "zprofile" ]; then
    full="$(pwd)/profile"
  fi
  ln=$(echo $HOME/.$f | sed s/__/\\//g)
  mkdir -p $(dirname $ln)

  if [ -L "${ln}" ]; then
    got=$(readlink ${ln})
    if [ "${got}" = "${full}" ]; then
      echo "[ ✔ ] ${ln}"
      continue
    fi
    echo "[rm ] $ln -> ${got}"
    rm -f "$ln"
  elif [ -f "${ln}" -o -d "${ln}" ]; then
    echo "[mv ] ${ln} -> ${ln}.bak"
    mv "${ln}" "${ln}.bak"
  fi

  echo "[ln ] $ln -> ${full}"
  ln -s "${full}" "${ln}"
done

if [ -e "$HOME/.vim/bundle/Vundle.vim" ]; then
  cd $HOME/.vim/bundle/Vundle.vim
  git fetch
  git pull
else
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi


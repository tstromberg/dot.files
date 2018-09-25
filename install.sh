#!/bin/sh
cd `dirname $0`
mkdir -p "${HOME}/.config"

files="`ls | egrep -v "README|\.sh"` zprofile"
for file in $files
do
  target="`pwd`/$file"
  link=$(echo $HOME/.$file | sed s/__/\\//g)
  mkdir -p $(dirname $link)

  if [[ -n "${DISPLAY}" ]]; then
    if [[ "${file}" = "tilix.conf" ]]; then
      echo "Loading tilix.conf ..."
      dconf load /com/gexperts/Tilix/ < tilix.conf
      continue
    fi
  fi

  if [[ "${file}" = "zprofile" ]]; then
    target="$HOME/.profile"
  fi

  if [[ -f "${link}" && -d "${link}" ]]; then
    echo "* Making backup: ${link}.bak"
    mv "$link" "${link}.bak"
  elif [[ -L "${link}" ]]; then
    echo "* Removing $link symlink"
    rm -f "$link"
  fi

  echo "- $target -> $link"
  ln -s "${target}" "${link}"
done

#!/bin/sh

cd `dirname $0`
files="`ls | egrep -v "README|install.sh"` zprofile" 

for file in $files
do
  target="`pwd`/$file"
  link=$(echo $HOME/.$file | sed s/__/\\//g)

  if [ "$file" = "tilix.conf" ]; then
    echo "Loading tilix.conf ..."
    dconf load /com/gexperts/Tilix/ < tilix.conf
    continue
  fi

  # This is a special case.
  if [ "$file" = "zprofile" ]; then
    target="$HOME/.profile"
  fi

  if [ -f $link ]; then
    echo "* Making backup: ${link}.bak"
    mv "$link" "${link}.bak"
  elif [ -L "$link" ]; then
    echo "* Removing $link symlink"
    rm -f "$link"
  fi

  echo "- $target -> $link"
  ln -s $target $link
done

# Start fish if installed.
if echo $- | grep -q i; then
  test -x /usr/bin/fish \
    && exec env SHELL=/usr/bin/fish /usr/bin/fish -i
fi

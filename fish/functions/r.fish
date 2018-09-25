function r
  cd (find ~/go/src/github.com -maxdepth 2 -name $argv | head -n 1)
end

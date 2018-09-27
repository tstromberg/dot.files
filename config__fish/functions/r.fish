function r -d "repo switcher" -a name
  set repo (find ~/go/src ~/src -maxdepth 2 -name $name | head -n 1)
  if test -n $repo
    cd $repo
  else
    echo "Unable to find repo for $name"
  end
end

function r -d "repo switcher" -a name
  set repo (find ~/go/src ~/src -maxdepth 3 -name $name | head -n 1)
  if test -d $repo/.git
    cd $repo
  else
    echo "Unable to find repo for $name"
  end
end

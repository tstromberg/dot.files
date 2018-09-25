function b -d "git-brancher" -a name
  if test -z $name
    git branch
    return
  end

  git checkout master >/dev/null
  git checkout $name; or git checkout -b $name
end



function b -d "git-brancher" -a name
  if test -z $name
    git branch
    return
  end


  set my_main (git rev-parse --abbrev-ref origin/HEAD | cut -d/ -f2)
  git checkout $my_main; or return
  git checkout $name; or git checkout -b $name; and git push --set-upstream origin directives
end

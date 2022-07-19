function up
  set branch (git branch | grep "^*" | cut -d" " -f2)

  if test -z $branch
      echo "not sure what branch I am on?"
      return
  end

  if not git remote -v | grep -q upstream
      echo "No upstream set, run: git remote add upstream https://github.com/owner/repo"
    return
  end

  git fetch
  git pull

  set my_main (git rev-parse --abbrev-ref origin/HEAD | cut -d/ -f2)
  set up_main (git remote show upstream | grep HEAD | cut -d: -f2 | xargs)

  echo "merging upstream/$up_main into $branch/$my_main"
  git fetch upstream; \
    and git checkout $my_main; \
    and git merge --ff upstream/$up_main; \
    and git checkout $branch; \
    and git merge --ff $my_main
end


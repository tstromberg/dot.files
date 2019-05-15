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

  echo "merging upstream into $branch"
  git fetch upstream; \
    and git checkout master; \
    and git merge upstream/master; \
    and git checkout $branch; \
    and git merge master
end


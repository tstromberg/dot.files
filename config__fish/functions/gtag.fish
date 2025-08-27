function b -d "gtag" -a version
  git pull
  git tag -a v$version -m $version
  git push --tags
end

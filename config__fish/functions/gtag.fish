function gtag -d "gtag" -a vers
  echo "$vers"
  git pull

  # Tag root module
  git tag -a "v$vers" -m "$vers"

  # Tag all submodules
  find . -name go.mod -not -path "./go.mod" | while read -r mod
    set dir (dirname $mod)
    set dir (string replace -r '^\\./' '' $dir)
    echo "Tagging $dir/v$vers"
    git tag -a "$dir/v$vers" -m "$vers"
  end

  git push --tags -f
end

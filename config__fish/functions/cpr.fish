function cpr -d "cpr" -a title
  git add pkg cmd
  git commit -am "$title"
  gh pr create --title "$title" --body ""
end

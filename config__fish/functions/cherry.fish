function cherry -d "cherry-picker" -a id
  set branch cherry-(echo $id | cut -c1-5)
  git fetch --all \
    ; and git checkout -b $branch \
    ; and git cherry-pick $id \
    ; and git push -u origin $branch
end

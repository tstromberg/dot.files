function p --wraps=git --description 'alias p=git push'
    set branch (git branch --show-current)

    if test -z $branch
        echo "not sure what branch I am on?"
        return
    end

    set out (git push; or git push --set-upstream origin $branch)
    echo $out
    set url (echo $out | egrep -o "https:.*")

    if test -n $url
        echo "url: [$url]"
        open $url
    end
end

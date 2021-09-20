function kl -d "kubernetes logs" -a namespace
  kubectl get pods -n $namespace --no-headers=true | awk '{ print $1 }'  \
    | xargs kubectl logs -n $namespace \
    | perl -ne 'if (/"ts":(.*?),/) { print gmtime($1) . " | " . $_; }'
end

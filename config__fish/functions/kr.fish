function kr -d "kubernetes resources" -a namespace
  set r (kubectl api-resources | grep -v "^NAME" | awk '{print $1 }' | sort -u | xargs | sed s/" "/","/g)
  kubectl get $r -n $namespace 2>/dev/null
end



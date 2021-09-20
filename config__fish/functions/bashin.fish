function bashin -d "get bash in a container" -a pod ns
 kubectl exec --stdin --tty $pod -n $ns -- /bin/bash
end



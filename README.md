# k8shserver

# building
1. make push

# running
1. make sure `kubefed` and `kubectl` are in `$PATH`
1. create cluster

    ```
    ./create.sh
    ```
    
1. deploy service, ingress and replica set

    ```
    kubectl --context=federation create -f services/k8shserver.yaml
    kubectl --context=federation create -f ingress/k8shserver.yaml
    kubectl --context=federation create -f rs/k8shserver.yaml
    ```
    
1. query the service


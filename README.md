# k8shserver
Configuration files used in http://blog.kubernetes.io/2016/12/cluster-federation-in-kubernetes-1.5.html blog post. 

Before you start update `scripts/0-settings.sh` with your project name, domain. Then run:

    . scripts/0-settings.sh

# build images
You can skip this step. Images are already deployed to Docker Hub repository

    make push

# running
1. make sure you have `gcloud` utility
1. create cluster

    ```
    . scripts/1-create.sh
    ```

1. make sure `kubefed` and `kubectl` are in `$PATH`
1. initialize kubectl config

    ```
    . scripts/2-getcredentials.sh
    ```
    
1. initialize federation

    ```
    . scripts/3-initfed.sh
    ```

1. join clusters to federation plane

    ```
    . scripts/4-joinfed.sh
    ```

1. deploy service, ingress and replica set

    ```
    kubectl --context=federation create -f services/k8shserver.yaml
    kubectl --context=federation create -f ingress/k8shserver.yaml
    kubectl --context=federation create -f rs/k8shserver.yaml
    ```
    
1. query the service


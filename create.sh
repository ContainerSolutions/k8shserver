#!/bin/bash -x
source settings.sh

for zone in $federation_zone ${worker_zones[@]}
do
	gcloud container clusters create gce-$zone --project=$project  --zone=$zone   --scopes "cloud-platform,storage-ro,logging-write,monitoring-write,service-control,service-management,https://www.googleapis.com/auth/ndev.clouddns.readwrite"
	gcloud -q container clusters get-credentials gce-$zone --zone=$zone --project=$project
done

federation_host_cluster=gke_${project}_${federation_zone}_gce-${federation_zone}
kubefed init federation --image="gcr.io/google_containers/hyperkube-amd64:v1.5.0-beta.3" --host-cluster-context=${federation_host_cluster} --dns-zone-name=${dns_zone}
i=0
for zone in $federation_zone ${worker_zones[@]}
do
  let i=i+1
  worker_cluster_context=gke_${project}_${zone}_gce-${zone}
#  kubectl --context=${federation_host_cluster} delete secret cluster${i} --namespace=federation-system
	kubefed --context=federation join cluster${i} --cluster-context=${worker_cluster_context}   --host-cluster-context=${federation_host_cluster}
done
kubectl --context=federation get clusters -w

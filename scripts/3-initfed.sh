kubefed init federation --image=gcr.io/google_containers/hyperkube-amd64:v1.5.1 --host-cluster-context=gke_${FED_PROJECT}_${FED_HOST_CLUSTER}_gce-${FED_HOST_CLUSTER} --dns-zone-name=${FED_DNS_ZONE}

kubefed init federation --image=gcr.io/google_containers/hyperkube-amd64:v1.5.1 --host-cluster-context=gke_${FED_PROJECT}_${FED_ZONE}_gce-${FED_ZONE} --dns-zone-name=${FED_DNS_ZONE}

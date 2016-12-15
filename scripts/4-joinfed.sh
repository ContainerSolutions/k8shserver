kubefed --context=federation join cluster-europe-west1-b --cluster-context=gke_${FED_PROJECT}_europe-west1-b_gce-europe-west1-b --host-cluster-context=gke_${FED_PROJECT}_${FED_ZONE}_gce-${FED_ZONE}

kubefed --context=federation join cluster-asia-east1-a --cluster-context=gke_${FED_PROJECT}_asia-east1-a_gce-asia-east1-a --host-cluster-context=gke_${FED_PROJECT}_${FED_ZONE}_gce-${FED_ZONE}

kubefed --context=federation join cluster-us-east1-b --cluster-context=gke_${FED_PROJECT}_us-east1-b_gce-us-east1-b --host-cluster-context=gke_${FED_PROJECT}_${FED_ZONE}_gce-${FED_ZONE}


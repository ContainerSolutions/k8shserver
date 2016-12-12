#!/bin/bash
source settings.sh

for zone in $federation_zone ${worker_zones[@]}
do
	gcloud -q container clusters delete gce-$zone --project=$project  --zone=$zone &
done

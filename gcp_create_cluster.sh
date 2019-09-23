#!/bin/bash
echo "Inside create_custom_cluster.sh script.."

BUCKET=qwiklabs-gcp-c306784abd2feef1

echo "Bucket = $BUCKET"
echo "Region = $MYREGION"
echo "Zone = $MYZONE"
echo "Project = $DEVSHELL_PROJECT_ID "

gcloud dataproc clusters create cluster-custom --bucket $BUCKET --subnet default --region $MYREGION --zone $MYZONE --master-machine-type n1-standard-2 --master-boot-disk-size 100 --num-workers 2 --worker-machine-type n1-standard-1 --worker-boot-disk-size 50 --num-preemptible-workers 2 --image-version 1.2 --scopes 'https://www.googleapis.com/auth/cloud-platform' --tags customaccess --project $DEVSHELL_PROJECT_ID --initialization-actions 'gs://qwiklabs-gcp-c306784abd2feef1/lab5/init-script.sh'


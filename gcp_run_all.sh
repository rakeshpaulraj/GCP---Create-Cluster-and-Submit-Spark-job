#!/bin/bash
echo "Inside gcp_custom_cluster.sh script.."

source myenv

BUCKET=qwiklabs-gcp-8d0d530e42ca05fb

echo "Bucket = $BUCKET"
echo "Region = $MYREGION"
echo "Zone = $MYZONE"
echo "Project = $DEVSHELL_PROJECT_ID "

##------------------------------
## Create Custom Clusters
##------------------------------
echo "Creating Custom Cluster.."
gcloud dataproc clusters create cluster-custom \
	--bucket $BUCKET \
	--subnet default \
	--region $MYREGION \
	--zone $MYZONE \
	--master-machine-type n1-standard-2 \
	--master-boot-disk-size 100 \
	--num-workers 2 \
	--worker-machine-type n1-standard-1 \
	--worker-boot-disk-size 50 \
	--num-preemptible-workers 2 \
	--image-version 1.2 \
	--scopes 'https://www.googleapis.com/auth/cloud-platform' \
	--tags customaccess \
	--project $DEVSHELL_PROJECT_ID \
	--initialization-actions 'gs://qwiklabs-gcp-8d0d530e42ca05fb/init-script.sh'


#------------------------------
# Create Custom Firewall rules
#------------------------------
gcloud compute \
	--project $DEVSHELL_PROJECT_ID \
	firewall-rules create allow-custom \
	--direction=INGRESS \
	--priority=1000 \
	--network=default \
	--action=ALLOW \
	--source-ranges $BROWSER_IP/32 \
	--target-tags customaccess \
	--rules=tcp:8088,tcp:9870


#------------------------------
# Submit Pyspark job
#------------------------------
BUCKET=qwiklabs-gcp-8d0d530e42ca05fb
echo "Submitting Pyspark job wordcount.py into cluster cluster-custom"

gcloud dataproc jobs submit pyspark gs://$BUCKET/wordcount.py --cluster cluster-custom --region $MYREGION


#------------------------------
# Delete Custom Clusters
#------------------------------
echo "Deleting Custom Cluster.."

gcloud dataproc clusters delete -q cluster-custom --region $MYREGION
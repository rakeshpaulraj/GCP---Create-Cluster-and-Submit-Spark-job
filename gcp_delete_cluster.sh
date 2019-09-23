#!/bin/bash
echo "Deleting Custom Cluster.."

gcloud dataproc clusters delete cluster-custom --region $MYREGION
#!/bin/bash

BUCKET=qwiklabs-gcp-8d0d530e42ca05fb
echo "Submitting Pyspark job wordcount.py into cluster cluster-custom"

gcloud dataproc jobs submit pyspark gs://$BUCKET/wordcount.py --cluster cluster-custom --region $MYREGION
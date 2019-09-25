## GCP - Creation of Cluster, Submit Spark job and Deletion of Cluster

### Scope of the project
This project is to illustrate how to submit a Spark job in Google Cloud (GCP) by creating a Dataproc Cluster and by deleting the Cluster after the job processing



### Scripts
The following scripts are added in this repository.

* gcp_create_cluster.sh
    * Script to create a Dataproc cluster
* gcp_create_firewall_rule.sh
    * Script to create a Firewall rule
* gcp_submit_job.sh
    * Script to submit Spark job into Dataproc Cluster
* gcp_delete_cluster.sh
    * Script to delete the Dataproc cluster
* gcp_run_all.sh
    * Script to run all the above steps using a single script
* pyspark_wordcount.py
    * Python program to perform word count. This program is called by the Spark job.



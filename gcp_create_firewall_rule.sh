#!/bin/bash
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
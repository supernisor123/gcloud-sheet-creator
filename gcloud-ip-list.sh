#!/bin/sh

gcloud auth login 
gcloud projects list --sort-by=projectId
echo "please_enter_project_id"
read  proj_id
instance=`gcloud compute  --project  $proj_id instances list --format="csv(name,ZONE,EXTERNAL_IP,INTERNAL_IP,MACHINE_TYPE)"`

while IFS=$'\n' read -r -a line 
do
    IFS="," read -r name zone ext_ip int_ip machine machine1<<<  "$line"
post=`curl -X POST -d name=$name -d ext_ip=$ext_ip -d int_ip=$int_ip -d machine=$machine -d  project=$proj_id \
http://replace the apps script url link here`
done <<< "$instance"



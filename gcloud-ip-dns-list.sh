#!/bin/sh


#gcloud auth revoke  
#gcloud auth login 
gcloud projects list --sort-by=projectId
echo "please_enter_project_id"
read  proj_id
instance=`gcloud compute  --project  $proj_id instances list --format="csv(name,ZONE,EXTERNAL_IP,INTERNAL_IP,MACHINE_TYPE)"\ |sed  's/custom (/custom(/g' |sed 's/, /,/g' |sed 's/ vCPU/vCPU/g'|sed 's/ GiB/GiB/g'`
dns=`gcloud dns managed-zones list --format="csv(NAME)"`

for i in `echo $instance | tr ' ' '\n'`
do

IFS="," read -r name zone ext_ip int_ip machine <<<  "$i"
echo "ext:$ext_ip"
post=`curl -X POST -d name=$name -d ext_ip=$ext_ip -d int_ip=$int_ip -d machine=$machine -d  project=$proj_id \
-d d_name="" \
https://script.google.com/macros/s/AKfycbyBcpSNRepwCLyf-O_2jAVvbTrOCdnwDM4dxOrTS83s8aK-954/exec`

#for j in `echo $dns | tr ' ' '\n'`
#do
dns_data=`gcloud dns record-sets list --zone asia-awoo-org --format="csv(NAME,TYPE,DATA)"| grep -v "google"`
for k in `echo $dns_data | tr ' ' '\n'`
do
IFS="," read -r d_name type data <<<  "$k"
if [ "$ext_ip" == "$data" ]; then
post=`curl -X POST -d name="" -d ext_ip="" -d int_ip="" -d machine="" -d  project=$proj_id \
-d d_name=$d_name \
https://script.google.com/macros/s/AKfycbyBcpSNRepwCLyf-O_2jAVvbTrOCdnwDM4dxOrTS83s8aK-954/exec`
fi
#done
done
done


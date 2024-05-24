#!/bin/bash
# Cretae ami_list.txt file with list of AMIs
while read -r ami_id
do
    if [[ -n "$ami_id" ]]; then
        echo "describing the image : $ami_id"
        describe_image=$(aws ec2 describe-images --image-ids "$ami_id") 
        response=$(echo "$describe_image"| jq  .Images[].BlockDeviceMappings[].Ebs.SnapshotId | jq . -r)
        aws ec2 deregister-image --image-id "$ami_id"
        for snapshot in $response; do 
            echo "$snapshot"
            aws ec2 delete-snapshot --snapshot-id "$snapshot"
        done
        unset describe_image
    fi
done  < awslist

for i in `cat list`;
do 
    echo $i; 
    ssh $i "uptime";
done



aws s3 cp s3://hsarch-artifactory-523140806637-us-east-2/Build_Files/amazon-cloudwatch-agent.json /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d/
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json -s
/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d
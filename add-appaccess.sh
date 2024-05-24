#!/bin/bash
while read -r server value ;do
        aws ec2 create-tags --resources "$server" --tags Key=Stack,Value="$value"
        echo "Added "$value" to "$server""
done < server-list
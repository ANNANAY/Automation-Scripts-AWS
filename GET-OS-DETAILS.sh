#!/bin/bash
echo "IP,OS-RELEASE" > os-output.csv
for i in `cat server-list`
do
    OS=$(ssh $i "cat /etc/redhat-release")
    if [[ -z $OS ]]; then
        echo "$i,$OS" >> os-output.csv
    else
        RS=$(ssh $i "cat /etc/os-release | grep PRETTY_NAME | cut -d '=' -f 2")
        echo "$i,$RS" >> os-output.csv
    fi
    echo "$i has $OS"
done

PRE=""

df -h | awk '{print $1,$6}'

#!/bin/bash
echo "Match ID,IAM Profile" > op.csv
for i in `cat ec2-list`
do
    IAM=$(aws ec2 describe-instances --region us-east-2 --instance-id $i --query Reservations[*].Instances[*].IamInstanceProfile.Arn --output text)
    echo -n "$i" >>op.csv
    echo $IAM | cut -d '/' -f 2 >> op.csv
done


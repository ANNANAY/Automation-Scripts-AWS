#!/bin/bash
echo "Instance-ID,APPACCESS" > op.csv
for i in `cat ec2-list`
do
        SCHEDULE=$(aws ec2 describe-instances --instance-ids "$i" --query 'Reservations[].Instances[].Tags[?Key==`APPACCESS`].Value' --output text)
        echo $i "," $SCHEDULE >> op.csv
done

7X1311239

#!/bin/bash
echo "Instance-ID,ASG-Name" > op.csv
for i in `cat ec2-list`
do
        SCHEDULE=$(aws ec2 describe-instances --instance-ids "$i" --query 'Reservations[].Instances[].Tags[?Key==`aws:autoscaling:groupName`].Value' --output text)
        echo $i "," $SCHEDULE >> op.csv
done
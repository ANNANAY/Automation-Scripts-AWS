#!/bin/bash
echo  "File-Details , Host Name" >> output.csv
for i in `cat list`
do 
    echo $i " "
    filen = ssh $i "cd /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.d;ls -al" >> output.csv 
done




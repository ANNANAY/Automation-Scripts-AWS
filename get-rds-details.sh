#!/bin/bash
aws rds describe-db-instances --query DBInstances[*].DBInstanceIdentifier | awk -F'"' '{for(i=2;i<NF;i+=2) print $i}' > db-list
echo "DB=Instance-identifier in the next line SG Ids" > rds-sg-details.txt
for i in `cat db-list`
do
    echo $i >> rds-sg-details.txt
    aws rds describe-db-instances --db-instance-identifier $i --query DBInstances[*].VpcSecurityGroups >> rds-sg-details.txt
done

#!/bin/bash
echo "DB-Identifier,VPC_ID" > rds-vpc.csv
aws rds describe-db-instances --query DBInstances[*].DBInstanceIdentifier | awk -F'"' '{for(i=2;i<NF;i+=2) print $i}' > db-list
for i in `cat db-list`
do
    VPCID=$(aws rds describe-db-instances --db-instance-identifier $i --query DBInstances[*].DBSubnetGroup.VpcId --output text)
    echo $i,$VPCID >> rds-vpc.csv
done

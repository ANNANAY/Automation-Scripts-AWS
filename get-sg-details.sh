#!/bin/bash
GROUPNAMELIST=$(aws ec2 describe-security-groups --filters Name=ip-permission.cidr,Values=172.30.104.0/23 --query SecurityGroups[*].GroupName)
echo "$GROUPNAMELIST" >> sg-names-list
VPCIDLIST=$(aws ec2 describe-security-groups --filters Name=ip-permission.cidr,Values=172.30.104.0/23 --query SecurityGroups[*].VpcId)
echo "$VPCIDLIST" >> sg-vpc-id-list
OWNERLIST=$(aws ec2 describe-security-groups --filters Name=ip-permission.cidr,Values=172.30.104.0/23 --query SecurityGroups[*].OwnerId --output text)
echo "$OWNERLIST" >> owner-list
GROUPIDLIST=$(aws ec2 describe-security-groups --filters Name=ip-permission.cidr,Values=172.30.104.0/23 --query SecurityGroups[*].GroupId)
echo "$GROUPIDLIST" >> sg-id-list
echo "SG-NAME,VPC-ID,ACCOUNT,SG-ID,CIDR,TERRAFORM,CFT" > sg-output-1.csv
while read -r -u 3 GROUPNAME && read -r -u 4 VPCID && read -r -u 5 OWNERID && read -r -u 6 GROUPID
do
   echo "$GROUPNAME,$VPCID,$OWNERID,$i,$GROUPID" >> sg-output-1.csv
done 3<sg-names-list 4< sg-vpc-id-list 5< owner-list 6< sg-id-list
#!/bin/bash
echo "Policy-Name,Role_To_Which_Attached,User,Group" > policy-details.csv
for i in `cat policy-list`
do
    ARN="arn:aws:iam::691339910992:policy/$i"
    ROLES=$(aws iam list-entities-for-policy --policy-arn $ARN --query PolicyRoles[*].RoleName --output text | tr '\t' ',')
    USERS=$(aws iam list-entities-for-policy --policy-arn $ARN --query PolicyUsers[*].UserName --output text | tr '\t' ',')
    GROUPS=$(aws iam list-entities-for-policy --policy-arn $ARN --query PolicyUsers[*].GroupName --output text | tr '\t' ',')
    echo "$i,$ROLES,$USERS,$GROUPS" >> policy-details.csv
done
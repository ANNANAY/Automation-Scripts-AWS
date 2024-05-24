#!/bin/bash
echo "IAM-User,APPACCESS" > op.csv
for i in `cat iam-list`
do
    APPACCESS=$(aws iam get-user --user-name $i --query 'User.Tags[?Key==`APPACCESS`].Value' --output text)
    echo "$i,$APPACCESS" >> op.csv 
done
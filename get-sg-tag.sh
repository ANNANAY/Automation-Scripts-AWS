#!/bin/bash
echo "SG-ID,TERRAFORM,CFT" > sg-terraform-output.csv
for i in `cat sg-id-list`
do
    TERRAFORM=$(aws ec2 describe-tags --filters "Name=resource-id,Values='$i'" "Name=key,Values=TERRAFORM" --query Tags[*].Value --output text)
    CFT=$(aws ec2 describe-tags --filters "Name=resource-id,Values='$i'" "Name=key,Values=aws:cloudformation:stack-name" --query Tags[*].Value --output text)
    echo "$i,$TERRAFORM,$CFT" >> sg-tags-output.csv
done

#!/bin/bash
echo "USERS,POLICIES"> output.csv
for i in `cat iam-list`
do
    POLICIES=$(aws iam list-attached-user-policies --user-name "$i" --output text)
    echo "$i,$POLICIES" >> output.csv
done
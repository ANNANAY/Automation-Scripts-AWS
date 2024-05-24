#!/bin/bash
echo "USERS,POLICIES"> output.csv
for i in `cat iam-list`
do
    POLICIES=$(aws iam list-attached-user-policies --user-name dsantra --query AttachedPolicies[*].PolicyName)
    echo "$POLICIES" > temp.txt
    while read -r name
    do
        echo "$i,$name" >> output.csv
    done < temp.txt
done
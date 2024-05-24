#!/bin/bash
for i in `cat list`
do
    echo "$i" >> users.csv
    users=`aws iam get-group --group-name hscam-build-infra --query 'Users[*].UserName'`
    for j in ${users}
    do
        echo "$j" >> users.csv
    done
done



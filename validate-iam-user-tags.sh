#!/bin/bash
ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
echo "USERS,AccessKeyId,Tags"> op.csv
USERS=$(aws iam list-users --query Users[*].UserName --output text)
# for USER in $USERS
do
    APPACCESS=$(aws iam list-user-tags --user-name $USER --query Tags[*].Key | grep APPACCESS)
    USERTYPE=$(aws iam list-user-tags --user-name $USER --query Tags[*].Key | grep UserType)
    CONTACT=$(aws iam list-user-tags --user-name $USER --query Tags[*].Key | grep Contact)
    NOTE=$(aws iam list-user-tags --user-name $USER --query Tags[*].Key | grep Note)
    echo -n $USER >> op.csv
    if [[ -z $APPACCESS ]]
    then
        echo -n ",Error in APPACCESS" >> op.csv
    else
        echo -n ", ">>op.csv
    fi
    if [[ -z $USERTYPE ]]
    then
        echo -n ",Error in UserType" >> op.csv
    else
        echo -n ", ">>op.csv
    fi
    if [[ -z $CONTACT ]]
    then
        echo -n ",Error in Contact" >> op.csv
    else
        echo -n ", ">>op.csv
    fi
    if [[ -z $NOTE ]]
    then
        echo -n ",Error in Note" >> op.csv
    else
        echo -n ", ">>op.csv
    fi
    echo >> op.csv
done
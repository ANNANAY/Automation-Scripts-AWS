#!/bin/bash
echo "USERS,Tags"> output.csv
USERS=$(aws iam list-users --query Users[*].UserName)
for i in $USERS
do
    TAGS=$(aws iam list-user-tags --user-name $i --query Tags[*] --output yaml > op.txt)
    KEY=$(aws iam list-access-keys --user-name $i --query)
        echo  "$i" >> output.csv
        while read -r tag
        do
                echo " , ,$tag" >> output.csv
        done < op.txt
done

Name, Access-Key, Tags

#!/bin/bash
ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
echo "USERS,AccessKeyId,Tags"> $ACCOUNT-output.csv
USERS=$(aws iam list-users --query Users[*].UserName --output text)
for USER in $USERS
do
        USERCHECK=$(aws iam get-user --user-name $USER --query 'User.Tags[?Key==`UserType`].Value' --output text)
        if [ "$USERCHECK" == "Associate" ]
        then
                continue
        else
                aws iam list-user-tags --user-name $USER --query Tags[*] --output yaml > op.txt
                STATUSCHECK=$(aws iam list-access-keys --user-name $USER --query AccessKeyMetadata[*].Status --output text)
                if [[ "$STATUSCHECK" == *"Active"* ]]
                then
                        aws iam list-access-keys --user-name $USER --query AccessKeyMetadata[*].AccessKeyId --output text > op-key.txt
                        echo -n  "$USER" >> $ACCOUNT-output.csv
                        while read -r  tag || read -r  key <&3
                        do
                                echo " ,$key,$tag" >> $ACCOUNT-output.csv
                        done < op.txt 3<op-key.txt
                fi
        fi
done
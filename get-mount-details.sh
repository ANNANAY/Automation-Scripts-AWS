#!/bin/bash
echo "Instance-IP,Details" > output.csv
for i in `cat list`
do
        OUTPUT=$( cat server-check | ssh $i 'bash -')
        echo "$i,$OUTPUT" >> output.csv
done
server-check
sudo su - ajoshi
STATUS_CODE=$?
echo "STATUS_CODE for the $i is - $STATUS_CODE"
if [ "$STATUS_CODE" -eq 0 ];
then
    LO=$(cat /etc/auto.home | grep -v ^# | grep ushof*)
    if [ -z $OUTPUT ];
    then
        LO="File not found"
    fi
else
    LO="Cannot sudo su - "
fi
echo $LO


#!/bin/bash
echo "Instance-IP,Details" > output.csv
for i in `cat list-2`
do
    MOUNT_DETAILS=$(ssh $i | df -h | grep home | awk '{print $1 "," $6}')
    echo "$i,$MOUNT_DETAILS" >> output.csv
done


#!/bin/bash
echo "Instance-IP,Details" > output.csv
for i in `cat list`
do
    output=$(cat server-check | ssh $i 'bash -')
    echo "$i,$OUTPUT" >> output.csv
done
    sudo su - abc
    STATUS_CODE=$?
    echo "STATUS_CODE for the $i is - $STATUS_CODE"
    if [ "$STATUS_CODE" -eq 0];
    then
        LO=$(cat abcde-file | grep -v ^# | grep xyz*)
        if [ -z $LO ];
        then
            LO="file is missing"
        else
            continue
        fi
    else
        LO = "Cannot sudo su - " 
    fi


#!/bin/bash
echo "Instance-IP,Details" > op.csv
for i in `cat list`
do
    ssh $i 'df -h | grep -E -i -w "/|/home"'>temp.txt 
    while read -r DET
    do
        echo "$i,$DET" >>op.csv
    done < temp.txt
done

df -h | grep -E -i -w "/|/home"

sudo su -
su - ajoshi
pwd

172.30.33.232
172.30.33.33
172.30.33.230
172.30.34.184
172.30.33.216
172.30.33.204
172.30.35.205
172.30.33.240
172.30.33.235
172.30.33.229
172.30.33.213
172.30.34.169
172.30.33.236
172.30.33.237
172.30.33.205
172.30.34.173
172.30.34.172
172.30.33.214
172.30.33.80
172.30.33.106
172.30.33.231
172.30.33.208
172.30.33.212
172.30.34.179
172.30.33.210
172.30.33.209
172.30.33.233
172.30.33.219
172.30.33.62
172.30.34.176
172.30.33.36
#!/bin/bash
echo "IP,DeepSecurityAgent">ds-agent-output.csv
for i in `cat server-list`
do
    DS=$(ssh $i "rpm -qa | grep ds_agent")
    echo "$i,$DS" >> ds-agent-output.csv
    if [[ -z "$DS" ]];then
        echo "$i does'nt contain DS agent"
    else
        # ssh $i "sudo rpm -e ds_agent"
        echo "Removed ds agent from $i" 
    fi
done